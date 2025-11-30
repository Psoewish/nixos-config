default:
    just --list

deploy host="desktop":
    if ["{{ host }}" = "desktop"]; then
    nh os switch
    elif ["{{ host }}" = "homelab"]; then
    nh os switch --target-host psoewish@192.168.1.100 --hostname homelab    
    else
    echo "try again, nerd"
    fi

update:
    nix flake update --commit-lock-file

check:
    nix flake check
