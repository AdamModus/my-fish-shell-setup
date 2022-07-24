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

## Install Homebrew

Homebrew is a package manager for macOS. Visit [this page](https://brew.sh/) for install instructions.

---

## Install tasty homebrew packages

Here are a few good packages I like to use in my command line:

- [cowsay](https://formulae.brew.sh/formula/cowsay) - I use it for my greeting message upon opening a new tab in command line.
- [fortune](https://formulae.brew.sh/formula/fortune) - A cool electronic fortune-cookie generator
- [lolcat](https://formulae.brew.sh/formula/lolcat) - Get rainbows and unicorns in your terminal!
- [gti](https://formulae.brew.sh/formula/gti) - Funny ASCII-art displaying typo-corrector for the classic "gti" instead of "git" typo.

---

## Install Fish

Go to <https://fishshell.com/> and download the latest version of fish. Use the installer as it will install fish to /usr/local (most online tutorials will have stuff that addresses fish being installed there).

---

## Setup as default shell

To change your login shell to fish, do the following steps.

Add the shell to /etc/shells with:

```bash
 echo /usr/local/bin/fish | sudo tee -a /etc/shells
```

This creates a new line in /etc/shells, so you can use the following command to change your default shell to fish:

```bash
 chsh -s /usr/local/bin/fish
```

If fish is not installed in /usr/local/bin, you can use the following command to find out where it is:

```bash
 which fish
```

You can use the result of that command and replace `/usr/local/bin/fish` after the `chsh -s` command. Because you installed fish with the online installer, this step should not be needed.

---

## Install Fisher

Fisher is a plugin manager for Fish. It offers a way to install and manage plugins for fish.
You can check the install guide [here](https://github.com/jorgebucaran/fisher). But, realistically, all you have to do is run the following command:

```bash
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
```

Now we have a nice way to install all the plugins we need.

---

## Install your plugins with Fisher

Here is a list of useful plugins. They all have installation instructions in the README.md file in their repos (links below)

- [z](https://github.com/jethrokuan/z) - A way to jump through folders quickly.
- [nvm](https://github.com/jorgebucaran/nvm.fish) - A way to manage multiple versions of Node.js.
- [Sponge](https://github.com/andreiborisov/sponge) - Removes typos from your command input history.
- [Tide](https://github.com/IlanCosman/tide) - A really nice prompt for fish. Keep in mind that you will need to install a font to have it working properly! (Instructions are in the README.md file in the repo.)

---

## Configure fish with your aliases, etc

Copy the contents of the `config.fish` file (in this repo) to your `~/.config/fish/config.fish` file.
