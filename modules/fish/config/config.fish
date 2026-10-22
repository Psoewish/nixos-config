if status is-interactive
    set -gx fish_greeting
    set -gx sponge_purge_only_on_exit true
    set -gx EDITOR hx
    set -gx VISUAL hx
    set -gx pure_show_numbered_git_indicator true
    set -gx pure_enable_nixdevshell true
    set -gx fish_transient_prompt 1
    set -gx pure_show_prefix_root_prompt true
    set -gx async_prompt_functions _pure_prompt_git

    abbr --add ff fastfetch
    abbr --add lg lazygit

    alias eza 'eza --icons always --color always --git --group-directories-first'
    alias ls eza
    alias la 'eza --all'
    alias ll 'eza --long --all'
    alias lt 'eza --tree --level 3 --git-ignore'

    alias cat 'bat --style=plain --paging=never --italic-text=always'
    alias cp 'rsync -ah --info=progress2'
    alias mkdir 'mkdir -pv'
end
