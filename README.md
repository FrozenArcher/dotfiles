# FrozenArcher's Dotfiles && Dotfile Manager

Including:

* An awesome dotfile manager `dot`
* Neovim `nvim/`
* alacritty `config/alacritty/`
* kitty `config/kitty/`
* picom (`picom-ftlabs-git` or default `picom`) `config/picom/`
* fontconfig `config/fontconfig/`
* zsh (ohmyzsh) `home/.zshrc`
* display manager `home/.xprofile`
* xorg `etc/X11/xorg.conf.d/`

## About the Dotfile Manager

The `dot` script is a dotfile manager that helps manage configuration files across multiple systems. 

To use the script, you can call it from the terminal with one of the available arguments:

* `(No argument)` - This is equal to calling `dot all` and will update both user and system configuration files.
* `a|all` - This updates both user and system configuration files.
* `u|user` - This updates only the user's configuration files.
* `s|sys|system` - This updates only the system's configuration files.
* `c|clean` - This deletes all dotfiles. You can specify whether you want to delete user, system, or all dotfiles by passing `user`, `system`, or `all` as an argument.
* `h|help` - This displays a help message and usage information for the script.
* `t|status` - This displays information on the status of the repository.
* `d|diff` - This displays information on any differences between the current configuration files and the repository.

In addition to these arguments, there are also several options you can use:

* `-p|--pretend` - This runs the script in pretend mode, where no changes are actually made to the filesystem.
* `-v|--verbose` - This enables verbose output, providing more detailed information on the actions being taken by the script.
* `-n|--no-backup` - This disables backup creation when updating or cleaning dotfiles.
* `-r|--recover` - This recovers deleted dotfiles from the backup directory when cleaning.

Overall, this script is useful for managing configuration files across multiple systems and ensuring consistency in your setup.


## Installing Everything

### Installing the dotfiles

``` bash
git clone git@github.com:FrozenArcher/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

The default repo location is `$HOME/dotfiles`, and `dot` script will be linked to `$HOME/.local/bin/dot`.

If you wish to change the two locations, you can set environment variables `dot_repo` and `dot_target_dir` when running the `install` script.

Remember that `dot_repo` is the location where you clone the repository.

``` bash
env dot_repo=/path/one dot_target_dir=/path/two ./install
```

If `install` script is run directly, the two variables will be set to their default values.

```bash
./install
```

After installing, please write `DOT_REPO` environment variable to your profile and add the above `dot_target_dir` to your `PATH`. By default, the values are set in `.zshrc` in this repository.

### Installing softwares:

```bash
paru -S feh pavucontrol zsh kitty alacritty xorg-xrandr picom-ftlabs-git ttf-jetbrains-mono-nerd ttf-lxgw-wenkai ttf-twemoji network-manager-applet udiskie blueman xfce4-power-manager xfce4-screensaver caffeine-ng pasystray fcitx5-im fcitx5-chinese-addons fcitx5-lua wget npm go fd ripgrep sed lxappearance qt5ct lsd bat unzip
```

### Installing oh-my-zsh:

```bash
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

After installing ohmyzsh, you need to re-run `dot` script to overwrite `.zshrc` created by ohmyzsh install script.

### Changing default shell to zsh:

```bash
chsh -s $(which zsh)
```
