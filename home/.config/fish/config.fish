status is-interactive; and begin
    set -gx fish_greeting
    set -gx sponge_purge_only_on_exit true
    set -gx EDITOR hx

    alias cat 'bat --style=plain --paging=never --italic-text=always'
    alias cp 'rsync -ah --info=progress2'
    alias mkdir 'mkdir -pv'
    alias ff fastfetch
    alias lg lazygit
    alias man batman

    alias eza 'eza --icons always --color always --git --group-directories-first'
    alias ls 'eza --all'
    alias ll 'eza --long --all'
    alias lt 'eza --tree --level 3 --git-ignore'

    direnv-instant hook fish | source
    zoxide init fish --cmd cd | source
end
