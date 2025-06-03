if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
    echo
    pokeget random --hide-name | fastfetch --file-raw -
end

# zoxide is a smarter cd command, inspired by z and autojump.
zoxide init fish | source

# fnm is a Node.js version manager written in Rust
fnm env --shell fish | source

# pyenv is a Python version manager - lazy load it because I rarely use it
function pyenv
    functions -q pyenv; or source (pyenv init - | psub)
    command pyenv $argv
end

###############################################################################
# Variables                                                                   #
###############################################################################

###############################################################################
# Aliases                                                                     #
###############################################################################

# Use the lsd package to make ls print commands use icons and customised colors
alias ls='lsd'

# l list all files and folders in current folder, including hiddens ones
alias l "ls -la"

# Quicker way of using yarn
alias y="yarn"

# Open finder in current folder
alias finder="open"

# Quicker way of using pnpm
abbr p pnpm

# fnm is a Node.js version manager written in Rust
alias nvm="fnm"

###############################################################################
# Functions                                                                   #
###############################################################################

function purge-node-modules -d "Remove all node_modules folders recursively in current folder and subfolders"
    echo "Purging node_modules 🔥" | lolcat
    find . -name "node_modules" -type d -prune -exec rm -rf '{}' +
    echo "No more node_modules 🎊" | lolcat
end

function brewerImp -d "Update, upgrade and cleanup brew"
    echo "updating brew ⚙️" | lolcat
    brew update
    echo "upgrading brew 🏎" | lolcat
    brew upgrade
    echo "cleaning up brew 🧹" | lolcat
    brew cleanup
end

function start-postman-app-local -d "Jumps to the postman app folder (/Users/rafaelfernandes/code/postman/postman-app) and launches the postman app targeting the browser by default"
    z /Users/rafaelfernandes/code/postman/postman-app
    y start --target browser
end

function start-postman-app-rspack -d "Jumps to the postman app folder (/Users/rafaelfernandes/code/postman/postman-app) and launches the postman app targeting the browser by default using the rspack compiler"
    z /Users/rafaelfernandes/code/postman/postman-app
    yarn start --bundler rspack --target browser
end

function start-postman-app-no-lazy-loading -d "Jumps to the postman app folder (/Users/rafaelfernandes/code/postman/postman-app) and launches the postman app with lazy loading disabled"
    z /Users/rafaelfernandes/code/postman/postman-app
    y start --no-lazy-compilation --target browser
end

function empty-commit -d "Commit an empty commit to (potentially) trigger a build"
    git commit --allow-empty --message="chore: trigger build"
end
