# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Working with psoewish

**Important**: psoewish prefers to treat work as a **collaborative endeavor**. When discussing accomplishments or contributions:
- Use "we" instead of "you" when talking about work done together
- Frame decisions and implementations as joint efforts
- Acknowledge that both human and AI contributions are valuable parts of the collaboration
- Don't attribute sole credit to either party—recognize the partnership

This applies even when psoewish made the final decisions or did the implementation—the collaborative process of discussion, research, and refinement is valued.

## Project Overview

This is a NixOS configuration repository for managing two machines using flakes and declarative configuration:

- **desktop**: A personal desktop system (x86_64-linux, NixOS 25.05)
- **homelab**: A homelab/server system (x86_64-linux, NixOS 25.11)

The setup uses `flake-parts` for modular flake structure, `import-tree` for automatic module discovery, `colmena` for remote system management (homelab deployed to 192.168.1.100), home-manager for user-level configuration, and sops-nix for secret management.

## Common Commands

### Building and Switching Configurations

**Desktop System:**
```bash
# Build the desktop configuration
sudo nixos-rebuild build --flake .#desktop

# Apply configuration to desktop (requires sudo)
sudo nixos-rebuild switch --flake .#desktop

# Test configuration (doesn't switch, useful for checking for errors)
sudo nixos-rebuild dry-build --flake .#desktop

# Rollback to previous generation
sudo nixos-rebuild switch --rollback --flake .#desktop
```

**Homelab System (Remote via Colmena):**
```bash
# Check homelab connectivity
colmena exec --on homelab -- echo "Connected"

# Build homelab configuration locally
colmena build --on homelab

# Apply to homelab server
colmena apply --on homelab

# Apply to all systems
colmena apply
```

### Flake Management

```bash
# Update all flake inputs to latest versions
nix flake update

# Update specific input(s)
nix flake update hyprland nixpkgs

# Check flake for issues
nix flake check

# Show flake structure
nix flake show
```

### Common Development Tasks

```bash
# Evaluate flake outputs (check for errors)
nix eval .#nixosConfigurations.desktop

# See what changed between generations
nixos-option boot.loader

# Check NixOS version and generation info
nixos-version --detailed

# Dry-run build to see what would change
sudo nixos-rebuild dry-build --flake .#desktop
```

## Architecture and Structure

### Directory Layout

- **`flake.nix`**: Minimal flake entry point - just inputs and flake-parts setup
- **`flake.lock`**: Lock file pinning all input versions (commit this!)
- **`parts/`**: Modular flake output definitions
  - `systems.nix`: NixOS system configurations with let bindings defining which profiles each host uses
  - `colmena.nix`: Colmena deployment configuration for remote management
- **`settings.nix`**: Global module settings (configures window manager, theme, terminals)
- **`lib/`**: Reusable Nix library functions
  - `mkOptions.nix`: Global configuration options/schema
  - `mkRoute.nix`: Routing configuration helper (homelab only)
- **`hosts/`**: Per-machine hardware and host-specific configuration
  - `desktop/`: Desktop machine configuration
    - `hardware/`: Hardware-specific configs (cpu, gpu, audio, bluetooth)
    - `config/`: Host-specific system config (network settings, DNS)
    - `boot.nix`: Bootloader and kernel configuration
    - `storage.nix`: Filesystem mounts and storage configuration
  - `homelab/`: Homelab server configuration
    - `hardware/`: Hardware-specific configs (cpu, gpu)
    - `config/`: Host-specific system config (media users/permissions, network settings)
    - `boot.nix`: Bootloader, kernel, and ZFS support
    - `storage.nix`: Filesystem mounts, ZFS configuration (hostId, scrub, trim)
- **`profiles/`**: Composable feature profiles organized by purpose
  - `core/`: Universal system configuration and CLI tools
    - `system/`: Core system settings (nix, locale, users, ssh, home-manager)
    - Top-level: CLI utilities (git, fish, helix, cli-utilities)
  - `graphical/`: Desktop GUI applications and environment
    - `hyprland/`: Window manager configuration (hyprland, fuzzel, session-manager)
    - `terminals/`: Terminal emulators (foot, ghostty)
    - `theming/`: Visual customization (stylix, noctalia, fastfetch)
    - `media/`: Media applications (mpv, spotify, obs, pulsemixer)
    - Top-level: Other GUI apps (zen browser, nixcord, file-manager)
  - `development/`: Development tools and environment
    - `management/`: Infrastructure tools (nh, colmena, lazygit)
    - Top-level: Development tools (lsp, zed, qmk, nix-ld)
  - `gaming/`: Gaming-related configuration (steam, kanata)
  - `homelab/`: Server services
    - `media-management/`: Media acquisition (*arr stack, sabnzbd, prowlarr, recyclarr)
    - `media-services/`: Media delivery (jellyfin, jellyseerr, bazarr)
    - `routing/`: Network services (traefik, cloudflared, blocky)
    - Top-level: Utility services (filebrowser - temporary)
- **`secrets/`**: Secret management
  - `secrets.nix`: Defines sops-nix secret paths and handling
  - `*.yaml`: Encrypted secret values (managed by sops-nix)
  - `soft-secrets.nix`: Gitignored file for build-time secrets (domain, email, etc.) - must be created locally and added with `git add -f`

### Profile-Based Architecture

The configuration uses a **profile-based** approach where functionality is organized by purpose rather than by host:

- **Profiles are composable**: Each host imports only the profiles it needs
- **No rigid host divisions**: Profiles can be mixed and matched across any system
- **Logical grouping**: Related functionality stays together regardless of where it's used
- **Easy to extend**: Adding a new machine is as simple as choosing which profiles to import

**Profile loading per host:**
- **Desktop**: `core`, `graphical`, `development`, `gaming`
- **Homelab**: `core`, `homelab`

This is defined clearly at the top of `parts/systems.nix` in let bindings, making it obvious which profiles each host uses.

### Module Loading System

The configuration uses `flake-parts` for modular flake structure and `import-tree` for automatic module discovery:

- **import-tree**: Called directly on directory paths to recursively load all `.nix` files
- **Automatic loading**: Files in `hosts/` and `profiles/` are automatically discovered
- **No explicit imports needed**: Any `.nix` file in the proper directories is automatically loaded
- **Profile-based filtering**: Each system imports only its relevant profiles as defined in `parts/systems.nix`

This means adding new functionality is as simple as creating a `.nix` file in the appropriate profile directory—no manual imports or `default.nix` files needed. Maintain consistent directory naming and structure.

### Flake-Parts Architecture

The flake is structured using flake-parts for modularity:

- **`flake.nix`**: Minimal—just inputs and imports `parts/*.nix`
- **`parts/systems.nix`**: Defines `nixosConfigurations` output with clear let bindings showing profile composition
- **`parts/colmena.nix`**: Defines `colmena` output for remote deployment
- Each part contributes to the overall flake outputs independently

This decouples configuration logic from the main flake file and makes it easy to add new output types (devShells, packages, etc.) without cluttering `flake.nix`.

### Hosts vs Profiles

**Hosts (`hosts/`)** contain:
- **Hardware configuration**: CPU, GPU, audio, bluetooth, etc.
- **Boot configuration**: Bootloader, kernel, initrd settings
- **Storage configuration**: Filesystem mounts, ZFS settings
- **Host-specific config**: Network settings, DNS, permissions, users specific to that machine's role

**Profiles (`profiles/`)** contain:
- **Feature modules**: Applications, services, and configurations
- **Composable bundles**: Groups of related functionality
- **Reusable config**: Anything that could apply to multiple machines

The key distinction: If it's about "what hardware is this" or "how is this specific machine configured," it goes in `hosts/`. If it's about "what features do I want," it goes in `profiles/`.

### Secrets Management

#### sops-nix (Runtime Secrets)

- Encrypted secrets live in `secrets/` directory (`.yaml` files)
- `secrets.nix` declares where secrets should be placed in `/run/secrets/`
- Access decrypted secrets via `config.sops.secrets."<name>".path`
- Example: Cloudflared credentials, Sonarr/Radarr API keys
- Requires appropriate keys/credentials for decryption on target systems
- **Important**: sops secrets are only decrypted at **activation time**, not build time
  - During evaluation, only the **path** to the secret is known (e.g., `/run/secrets/cloudflare/api`)
  - The actual secret content is only available when services run
  - Cannot use `builtins.readFile` on sops secret paths during evaluation

#### Soft Secrets (Build-time Secrets)

For values that need to be known at **build time** (like domain names, email addresses, tunnel IDs):

- `secrets/soft-secrets.nix`: Gitignored Nix file containing build-time secrets
- These are "soft secrets" - not highly sensitive, but preferred not to be in git history
- Analogy: Like locking your front door - not Fort Knox, but basic security hygiene

**Setup process:**
1. Create `secrets/soft-secrets.nix` with your values:
   ```nix
   {
     domain = "example.com";
     tunnelId = "your-tunnel-id";
     email = "your@email.com";
   }
   ```
2. Add to git index (but not commits): `git add -f secrets/soft-secrets.nix`
3. The file is gitignored but visible to Nix evaluation

**Usage:**
- Imported once in `parts/systems.nix` as `softSecrets`
- Passed to homelab via `specialArgs`
- Available in all homelab modules as `softSecrets.domain`, `softSecrets.email`, etc.
- Used by `mkRoute` to provide default domain/tunnelId values

**Note**: On fresh clones, you must recreate this file and run `git add -f` again. This is documented in the code comments in `parts/systems.nix`.

### Configuration Entry Points

**For desktop:**
- `parts/systems.nix`: Defines the desktop system configuration
- Imports: `hosts/desktop` + profiles (core, graphical, development, gaming)
- Includes desktop-specific inputs (chaotic-nyx)

**For homelab:**
- `parts/systems.nix`: Defines the homelab system configuration
- Imports: `hosts/homelab` + profiles (core, homelab)
- Includes mkRoute in specialArgs for routing configuration
- `parts/colmena.nix`: Deployment configuration for remote management

**Universal:**
- `profiles/core/`: Shared across all systems (system settings, CLI tools, shell environment)

## Key Technical Details

### System Arguments (specialArgs)

**All systems receive:**
- `inputs`: All flake inputs (nixpkgs, home-manager, etc.)
- `lib`: nixpkgs lib for module utilities
- `hostname`: Machine identifier
- `username`: Primary user
- `stateVersion`: NixOS state version

**Homelab-specific:**
- `mkRoute`: Function for route definitions (pre-configured with soft secrets)
- `softSecrets`: Build-time secrets (domain, tunnelId, email, etc.)

### Important Inputs

- **nixpkgs**: Unstable branch for latest packages
- **flake-parts**: Modular flake structure framework
- **import-tree**: Automatic recursive module discovery (github:vic/import-tree)
- **home-manager**: User-level configuration and dotfiles
- **hyprland**: Wayland window manager and plugins
- **sops-nix**: Encrypted secrets handling
- **colmena**: Remote system deployment
- **stylix**: Theming framework
- **chaotic-nyx**: Extra unstable packages (desktop only)

### State Versions

- Desktop: 25.05
- Homelab: 25.11

These should generally be kept stable—only update if needed as changing state version can affect system behavior.

## Common Patterns and Best Practices

1. **Hardware vs Config**: Keep hardware definitions separate from system configuration
2. **Profile Composition**: Think about "what do I want to do" not "where will this run"
3. **Colmena Deployment**: Target is 192.168.1.100, user must be "psoewish" with passwordless sudo
4. **Secrets Handling**: 
   - Use **sops-nix** for runtime secrets (API keys, credentials)
   - Use **soft-secrets.nix** for build-time values (domain, email)
   - Remember: sops secrets are paths during evaluation, content only at runtime
5. **Secrets Rotation**: Encrypted secrets require re-encryption when changing recipients or keys
6. **import-tree paths**: In `parts/systems.nix`, use relative paths from the parts directory (`../hosts/`, `../profiles/`, etc.)
7. **Profile organization**: Group by purpose/intent, not by technical category
8. **Accessing soft secrets**: In homelab modules, add `softSecrets` to function args to access `softSecrets.domain`, `softSecrets.email`, etc.

## Debugging and Troubleshooting

```bash
# Show what will change before applying
sudo nixos-rebuild dry-build --flake .#desktop

# Check for syntax errors in specific file
nix-instantiate --parse profiles/graphical/hyprland/hyprland.nix

# View flake structure (should show nixosConfigurations + colmena)
nix flake show

# Build specific system without switching
nix build .#nixosConfigurations.desktop.config.system.build.toplevel

# See generation differences
diff <(nix-store -q --tree /nix/var/nix/profiles/system-5-link) \
     <(nix-store -q --tree /nix/var/nix/profiles/system-6-link)

# Check colmena configuration
colmena build --on homelab
```

## Working with Home Manager

Home manager configuration is set up in `profiles/core/system/home-manager.nix`. User-specific configs can be added per-profile as needed. Changes are typically applied via:

```bash
# Apply home-manager changes (usually included in nixos-rebuild switch)
home-manager switch --flake .#psoewish@desktop
home-manager switch --flake .#psoewish@homelab
```

## Adding New Features

### Adding a new profile

1. Create a new directory under `profiles/` (e.g., `profiles/creative/`)
2. Add `.nix` files for each feature in that profile
3. Update `parts/systems.nix` to import the profile for the relevant host(s)
4. Rebuild to test: `sudo nixos-rebuild dry-build --flake .#desktop`

### Adding a feature to an existing profile

1. Create a `.nix` file in the appropriate profile directory
   - `profiles/core/` for universal features
   - `profiles/graphical/` for GUI applications
   - `profiles/development/` for dev tools
   - `profiles/gaming/` for gaming-related features
   - `profiles/homelab/` for server services

2. No need to manually import it—`import-tree` will automatically discover it

3. Rebuild to test:
   ```bash
   sudo nixos-rebuild dry-build --flake .#desktop
   ```

### Adding host-specific configuration

1. Add configuration to the appropriate location in `hosts/<hostname>/`:
   - `hardware/` for hardware-specific settings
   - `config/` for host-specific system configuration
   - `boot.nix` for boot/kernel changes
   - `storage.nix` for filesystem/storage changes

2. Rebuild to test

### Example: Adding a laptop

```nix
# In parts/systems.nix, add:
laptopHost = import-tree [ ../hosts/laptop ];
laptopProfiles = import-tree [
  ../profiles/core
  ../profiles/graphical
  ../profiles/development
  # Note: No gaming profile - different use case
];

# Then add the nixosConfiguration for laptop
```

This demonstrates the flexibility of the profile system—compose exactly what you need for each machine.
