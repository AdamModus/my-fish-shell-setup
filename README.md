# my-fish-shell-setup

This is a little repo for me to have a place to remember how to setup fish the way I like it in MacOS. I have an awful memory and this is not something I setup everyday, so it'll be good for me to have a place to store all these steps.

---

## Accessing hidden files

Have Finder show hidden files/folders. Fish config will be stored in a hidden folder, usually accessible in the following path: `/Users/YOUR_USERNAME_HERE/.config/fish`.

So having access to it might make it easier to customise things later, to your liking.

To do this, you can use the following command:

```bash
defaults write com.apple.Finder AppleShowAllFiles true
```

This will make Finder show hidden files and folders. But this will only be enacted when Finder starts the next time. So we gotta restart it for it to take effect.

You can do that with this command:

```bash
killall Finder
```

---

## Install Terminal apps

[iTerm2](https://iterm2.com/) is a replacement for the default Terminal app. It looks nice and has cool features.

---

## Set up iTerm2 theme

I quite like the [dracula theme](https://draculatheme.com/iterm). It's a nice dark theme with a nice dark background and not too much contrasty colors.

---

## Install Homebrew

Homebrew is a package manager for macOS. Visit [this page](https://brew.sh/) for install instructions.

---

## Install tasty homebrew packages

Here are a few good packages I like to use:
- [Alacritty](https://formulae.brew.sh/cask/alacritty) - A terminal emulator with GPU acceleration.
- [bartender](https://formulae.brew.sh/cask/bartender) - App to organise icons on the menu bar
- [btop](https://github.com/aristocratos/btop) - Resource monitor that shows usage and stats for processor, memory, disks, network and processes.
- [cmatrix](https://formulae.brew.sh/formula/cmatrix) - Matrix in the command line, because it's fun.
- [fastfetch](https://formulae.brew.sh/formula/fastfetch#default) - A fast system information display tool.
- [fish](https://formulae.brew.sh/formula/fish) - Fish shell, my favourite shell!
- [fnm](https://formulae.brew.sh/formula/fnm) - Fast and simple Node.js version manager, built in Rust.
- [git](https://formulae.brew.sh/formula/git) - Git
- [Ghostty](https://formulae.brew.sh/cask/ghostty) - A terminal emulator with GPU acceleration.
- [Ice](https://formulae.brew.sh/cask/jordanbaird-ice) - Open source alternative to bartender - Organise icons on the macos menu bar
- [Kitty](https://formulae.brew.sh/cask/kitty) - A terminal emulator with GPU acceleration.
- [lolcat](https://formulae.brew.sh/formula/lolcat) - Get rainbows and unicorns in your terminal!
- [lsd](https://formulae.brew.sh/formula/lsd) - A better `ls` command, with icons and colors.
- [pnpm](https://formulae.brew.sh/formula/pnpm) - Alternative JS package manager.
- [pyenv](https://formulae.brew.sh/formula/pyenv) - Python version manager
- [rectangle](https://formulae.brew.sh/cask/rectangle) - Move and resize windows using keyboard shortcuts or snap areas
- [rust](https://formulae.brew.sh/formula/rust) - Rust programming language, comes with Cargo (Rust's package manager).
- [stats](https://github.com/exelban/stats) - A macOS system monitor for the menu bar.
- [thefuck](https://formulae.brew.sh/formula/thefuck) - Utility to programmatically correct mistyped console commands.
- [yarn](https://formulae.brew.sh/formula/yarn) - (Version 1 only) JS package manager.
- [zoxide](https://formulae.brew.sh/formula/zoxide) - zoxide is a smarter cd command, inspired by z and autojump.

Here is a script to install them:
```
echo "🔄 Updating Homebrew..."
brew update
brew upgrade

echo "🍺 Installing CLI packages..."
brew install \
  btop \
  cmatrix \
  fastfetch \
  fish \
  fnm \
  git \
  lolcat \
  lsd \
  pnpm \
  pyenv \
  rust \
  thefuck \
  yarn \
  zoxide

echo "🍺 Installing Cask (GUI) apps..."
brew install --cask \
  alacritty \
  bartender \
  ghostty \
  jordanbaird-ice \
  kitty \
  rectangle \
  stats

echo "✅ All packages installed!"
```

---

## Install Rust packages

- [pokeget-rs](https://github.com/talwat/pokeget-rs) - A way to get Pokemon images from the PokeAPI.

---

## Install Fish

You've already installed it, if you installed the last brew package listed above!

---

### Setup as default shell

First of all, you need to enter fish. You can do that with this command:

```bash
fish
```

Fish does not know about brew yet, so the `brew` command is not yet recognised. That can be fixed with this command:

```bash
fish_add_path /opt/homebrew/bin
```

Now that fish and brew know each other, you can add the reference to the fish shell on your list of accepted system shells. You can do that with this command:

```bash
echo "/opt/homebrew/bin/fish" | sudo tee -a /etc/shells
```

Now, you can use the following command to change your default shell to fish:

```bash
chsh -s /opt/homebrew/bin/fish
```

---

### Install Fisher

Fisher is a plugin manager for Fish. It offers a way to install and manage plugins for fish.
You can check the install guide [here](https://github.com/jorgebucaran/fisher). But, realistically, all you have to do is run the following command:

```bash
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
```

Now we have a nice way to install all the plugins we need.

---

### Install your plugins with Fisher

Here is a list of useful plugins. They all have installation instructions in the README.md file in their repos (links below)

- [Tide](https://github.com/IlanCosman/tide) - A really nice prompt for fish.
  - Keep in mind that you will need to install [these fonts](https://github.com/IlanCosman/tide#fonts) to have it working properly!
    - After installing those fonts, set them as the default font in your terminal preferences. Open `Preferences / Profiles / Text` and select the font you want to use.
    - After these fonts are installed, make sure your have ligatures enabled and anti-aliasing as well.
  - Don't forget to configure tide!
- [dracula/fish](https://github.com/dracula/fish) - A dark theme for fish.
- [fish-abbreviation-tips](https://github.com/gazorby/fish-abbreviation-tips) - A way to get tips about abbreviations you can use in fish.
- [done](https://github.com/franciscolourenco/done) - A way to mark tasks as done.

---

## Configure fish with your aliases, etc

Copy the contents of the `config.fish` file (in this repo) to your `~/.config/fish/config.fish` file.
