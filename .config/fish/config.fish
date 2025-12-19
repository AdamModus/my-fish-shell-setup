if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
    echo
    pokeget random --hide-name | fastfetch --file-raw -
end

# thefuck is a command line tool that corrects your previous command
# thefuck --alias | source

# starship init fish | source

###############################################################################
# Tool Initialization (Some are lazy-loaded for performance)                          #
###############################################################################

# fnm is a Node.js version manager written in Rust (always loaded for workflow)
fnm env --shell fish | source

# zoxide is a smarter cd command, inspired by z and autojump
function z -d "Jump to directory"
    if not functions -q __zoxide_z
        zoxide init fish | source
    end
    __zoxide_z $argv
end

# pyenv is a Python version manager - lazy load it because I rarely use it
function pyenv -d "Python version manager"
    if not functions -q __pyenv_init
        source (pyenv init - | psub)
    end
    command pyenv $argv
end

# thefuck is a command line tool that corrects your previous command
if not set -q __thefuck_initialized
    function __thefuck_lazy_init --on-event fish_prompt
        thefuck --alias | source
        set -g __thefuck_initialized 1
        functions -e __thefuck_lazy_init
    end
end

###############################################################################
# Variables                                                                   #
###############################################################################

###############################################################################
# Aliases                                                                     #
###############################################################################

# Use the lsd package to make ls print commands use icons and customised colors
abbr ls lsd

# l list all files and folders in current folder, including hiddens ones
abbr l "lsd -la"

# Quicker way of using yarn
abbr y yarn

# Open finder in current folder
abbr finder open

# Quicker way of using pnpm
abbr p pnpm

# fnm is a Node.js version manager written in Rust
abbr nvm fnm

###############################################################################
# Functions                                                                   #
###############################################################################

function __require_command -d "Check if a command exists, exit if not"
    if not command -q $argv[1]
        echo "Error: $argv[1] not installed"
        return 1
    end
end

function purge-node-modules -d "Remove all node_modules folders recursively in current folder and subfolders"
    __require_command lolcat; or return 1
    echo "Purging node_modules 🔥" | lolcat
    find . -name "node_modules" -type d -prune -exec rm -rf '{}' +
    echo "No more node_modules 🎊" | lolcat
end

function brewerImp -d "Update, upgrade and cleanup brew"
    __require_command lolcat; or return 1
    echo "updating brew ⚙️" | lolcat
    brew update
    echo "upgrading brew 🏎" | lolcat
    brew upgrade
    echo "cleaning up brew 🧹" | lolcat
    brew cleanup
end

function start-postman -d "Start Postman app with various options"
    set -l app_path /Users/rafael.fernandespostman.com/code/postman/postman-app

    if not test -d $app_path
        echo "Error: Postman app path not found: $app_path"
        return 1
    end

    z $app_path

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

