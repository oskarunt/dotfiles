# .zprofile is sourced on login shells and before .zshrc. As a general rule, it should not change the
# shell environment at all.

if [[ -f /opt/homebrew/bin/brew ]]; then
    # Homebrew exists at /opt/homebrew for arm64 macos
    eval $(/opt/homebrew/bin/brew shellenv)
elif [[ -f /usr/local/bin/brew ]]; then
    # or at /usr/local for intel macos
    eval $(/usr/local/bin/brew shellenv)
elif [[ -d /home/linuxbrew/.linuxbrew ]]; then
    # or from linuxbrew
    test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
    test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# Added by OrbStack: command-line tools and integration
# Comment this line if you don't want it to be added again.
source ~/.orbstack/shell/init.zsh 2>/dev/null || :
