if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
    set -l toon (random choice {default,bud-frogs,dragon,dragon-and-cow,elephant,moose,stegosaurus,tux,vader})
    fortune -s | cowsay -f $toon | lolcat
end

# ____ _    _ ____ ____ ____ ____ 
# |__| |    | |__| [__  |___ [__  
# |  | |___ | |  | ___] |___ ___] 
#

# l list all files and folders in current folder, including hiddens ones
alias l="ll -la"

# Quicker way of using yarn
alias y="yarn"

# Open finder in current folder
alias finder="open"

# Quicker way of using pnpm
alias p="pnpm"

# alias getwifi="openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//' | xargs sudo ifconfig en0 ether"

# ____ _  _ _  _ ____ ___ _ ____ _  _ ____ 
# |___ |  | |\ | |     |  | |  | |\ | [__  
# |    |__| | \| |___  |  | |__| | \| ___] 
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

function empty-commit -d "Commit an empty commit to (potentially) trigger a build"
    git commit --allow-empty --message="chore: trigger build"
end
