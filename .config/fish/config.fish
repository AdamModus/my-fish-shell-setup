if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
    echo
    pokeget random --hide-name | fastfetch --file-raw -
end

# zoxide is a fast directory jumper
zoxide init fish | source

# pyenv is a Python version manager - lazy load it because I rarely use it
status --is-interactive; and functions -q pyenv; or source (pyenv init - | psub)

#                  _       _     _
# /\   /\__ _ _ __(_) __ _| |__ | | ___  ___
# \ \ / / _` | '__| |/ _` | '_ \| |/ _ \/ __|
#  \ V / (_| | |  | | (_| | |_) | |  __/\__ \
#   \_/ \__,_|_|  |_|\__,_|_.__/|_|\___||___/
#


#   _   _ _
#  /_\ | (_) __ _ ___  ___  ___
# //_\\| | |/ _` / __|/ _ \/ __|
#/  _  \ | | (_| \__ \  __/\__ \
#\_/ \_/_|_|\__,_|___/\___||___/
#

# Use the lsd package to make ls print commands use icons and customised colors
alias ls='lsd'

# l list all files and folders in current folder, including hiddens ones
alias l="ll -la"

# Quicker way of using yarn
alias y="yarn"

# Open finder in current folder
alias finder="open"

# Quicker way of using pnpm
alias p="pnpm"

#   ___                 _   _
#  / __\   _ _ __   ___| |_(_) ___  _ __  ___
# / _\| | | | '_ \ / __| __| |/ _ \| '_ \/ __|
#/ /  | |_| | | | | (__| |_| | (_) | | | \__ \
#\/    \__,_|_| |_|\___|\__|_|\___/|_| |_|___/
#

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
