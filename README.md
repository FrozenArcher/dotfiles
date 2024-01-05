# FrozenArcher's Dotfiles && Dotfile Manager

Including:

* An awesome dotfile manager `dot`
* Neovim `nvim/`
* hyprland `config/hypr/`
* waybar `config/waybar/`
* kitty `config/kitty/`
* picom (`picom-ftlabs-git` or default `picom`) `config/picom/`
* fontconfig `config/fontconfig/`
* zsh (ohmyzsh) `home/.zshrc`
* xorg environment `home/.xprofile`
* xorg.conf `etc/X11/xorg.conf.d/`
* tmux `home/.tmux.conf`

**NOTE** Files under `sysfiles-backup` are config files for my own laptop, and are not tracked by `dot`.

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

### Installing desktop environment dependencies:

#### Fonts

```bash
paru -S ttf-jetbrains-mono-nerd ttf-lxgw-wenkai ttf-lxgw-neo-xihei ttf-lxgw-fasmart-gothic ttf-twemoji
```

#### Common stuff

```bash
paru -S sed wget zsh kitty pavucontrol network-manager-applet udiskie blueman caffeine-ng fcitx5-{im,chinese-addons,lua} lsd bat unzip lolcat
```

#### Theming stuff

```bash
paru -S lxappearance qt5ct kvantum kvantum-theme-dracula-git dracula-gtk-theme candy-icons-git papirus-icon-theme capitaine-cursors
```

#### X stuff

```bash
paru -S feh xorg-xrandr picom-ftlabs-git xfce4-power-manager xfce4-screensaver pasystray 
```

#### Wayland stuff

```bash
paru -S waybar fuzzel
```

#### Neovim dependencies

```bash
paru -S npm go fd ripgrep nodejs clang
```

### Installing tmux:

```bash
paru -S tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Then enter tmux:

```bash
tmux
```

Install plugins by pressing `prefix` + `I`.

### Installing oh-my-zsh:

```bash
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

Please install omz before dotfiles. Otherwise, after installing omz, you need to run `dot` again to overwrite `.zshrc` created by the ohmyzsh install script.

### Installing dotfiles:

``` bash
git clone git@github.com:FrozenArcher/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

The default repository location is `$HOME/dotfiles`, and the `dot` script will be linked to `$HOME/.local/bin/dot`.

If you wish to change these locations, you can set environment variables `DOT_REPO` and `DOT_TARGET_DIR` when running the install script.

Remember that `DOT_REPO` is the location where you have cloned the repository.

``` bash
env DOT_REPO=/path/to/repo DOT_TARGET_DIR=/path/to/target ./install
```

If the `install` script is run directly, the two variables will be set to their default values.

```bash
./install
```

After installing, please add the `DOT_REPO` environment variable to your shell's profile and add the above `DOT_TARGET_DIR` to your `PATH`. By default, `DOT_REPO` is set to `~/dotfiles` in `.zshrc` in this repository.

### Changing default shell to zsh:

```bash
chsh -s $(which zsh)
```

### Setting up your wallpaper:

both `.fehbg` and `hyprpaper` will look up `~/.wallpaper` as your wallpaper, so link your favourite wallpaper to `~/.wallpaper`:

```bash
ln -sf /path/to/wallpaper ~/.wallpaper
```

## TODO

* clean up waybar config
* import scripts from my old dotfile repo
* write all dependencies in a file
