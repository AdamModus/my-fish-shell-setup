if not status is-interactive
    exit
end

function fish_greeting
    echo
    pokeget random --hide-name | fastfetch --file-raw -
end

# starship init fish | source

###############################################################################
# Tool Initialization (Some are lazy-loaded for performance)                          #
###############################################################################

# fnm is a Node.js version manager written in Rust (always loaded due to workflow requirements)
fnm env --shell fish | source

# zoxide is a smarter cd command, inspired by z and autojump
if command -q zoxide
    zoxide init fish | source
    alias z __zoxide_z
end

# pyenv is a Python version manager - lazy load it because I rarely use it
function pyenv -d "Python version manager"
    if not set -q __pyenv_initialized
        source (pyenv init - | psub)
        set -g __pyenv_initialized 1
    end
    command pyenv $argv
end

# thefuck is a command line tool that corrects your previous command
if command -q thefuck
    function __thefuck_lazy_load --on-event fish_preexec
        if not set -q __thefuck_initialized
            thefuck --alias | source
            set -g __thefuck_initialized 1
            functions -e __thefuck_lazy_load
        end
    end
end

###############################################################################
# Variables                                                                   #
###############################################################################

###############################################################################
# Aliases                                                                     #
###############################################################################

# Use the lsd package to make ls print commands use icons and customised colors
abbr --add ls lsd

# l list all files and folders in current folder, including hiddens ones
abbr --add l "lsd -la"

# Quicker way of using yarn
abbr --add y yarn

# Open finder in current folder
abbr --add finder open

# Quicker way of using pnpm
abbr --add p pnpm

# fnm is a Node.js version manager written in Rust
abbr --add nvm fnm

###############################################################################
# Functions                                                                   #
###############################################################################

function __require_command -d "Check if a command exists, exit if not"
    if test (count $argv) -eq 0
        echo "Error: no command specified"
        return 1
    end

    if not command -q $argv[1]
        echo "Error: $argv[1] not installed"
        return 1
    end
end

function purge-node-modules -d "Remove all node_modules folders recursively in current folder and subfolders"
    __require_command lolcat; or return 1

    # Count how many node_modules folders exist
    set -l count (find . -name "node_modules" -type d -prune -print | count)

    if test $count -eq 0
        echo "No node_modules folders found 🤷" | lolcat
        return 0
    end

    echo "Found $count node_modules folder(s)" | lolcat
    read -P "Are you sure you want to purge them? [Y/n] " -n 1 confirm

    # Default to yes if empty or starts with y/Y
    if test -z "$confirm"; or string match -qi "y*" "$confirm"
        echo ""
        echo "Purging node_modules 🔥" | lolcat
        find . -name "node_modules" -type d -prune -exec rm -rf '{}' +
        echo "No more node_modules 🎊" | lolcat
    else
        echo ""
        echo "Cancelled purge operation" | lolcat
    end
end

function brewerImp -d "Update, upgrade and cleanup brew"
    __require_command brew; or return 1
    __require_command lolcat; or return 1

    echo "updating brew ⚙️" | lolcat
    brew update; or return 1

    echo "upgrading brew 🏎" | lolcat
    brew upgrade; or return 1

    echo "cleaning up brew 🧹" | lolcat
    brew cleanup; or return 1

    echo "brewing complete 🍺" | lolcat
end

function start-postman -d "Start Postman app with various options"
    # Setting the app path based on user's home directory
    set -l app_path $HOME/code/postman/postman-app

    if not test -d $app_path
        echo "Error: Postman app path not found: $app_path"
        return 1
    end

    # Move to the app directory and stay there
    cd $app_path

    switch $argv[1]
        case browser
            yarn start-rspack --target browser
        case desktop
            yarn start-rspack
        case webpack
            yarn start --target browser
        case webpack-no-lazy
            yarn start --no-lazy-compilation --target browser
        case open
            yarn open-rspack
        case '*'
            echo "Usage: start-postman [browser|desktop|webpack|webpack-no-lazy|open]"
            echo ""
            echo "Options:"
            echo "  browser           - Start rspack targeting browser"
            echo "  desktop           - Start rspack targeting desktop"
            echo "  open              - Open rspack desktop app"
            echo "  webpack           - Start webpack targeting browser"
            echo "  webpack-no-lazy   - Start webpack without lazy loading"
            return 1
    end
end

###############################################################################
# Path Configuration                                                          #
###############################################################################

# export PATH="$HOME/.local/bin:$PATH"

# Added by Antigravity
fish_add_path /Users/rafael.fernandespostman.com/.antigravity/antigravity/bin
