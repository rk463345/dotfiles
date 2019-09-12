#!/usr/bin/env bash

# Get current dir (so run this script from anywhere)

export DOTFILES_DIR
export CONFIG_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CONFIG_DIR=$DOTFILES_DIR/.config

# Update dotfiles itself first

[ -d "$DOTFILES_DIR/.git" ] && git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master

# Bunch of symlinks

ln -sfv "$DOTFILES_DIR/.conkyrc" ~
ln -sfv "$DOTFILES_DIR/.fonts" ~
ln -sfv "$DOTFILES_DIR/.tmux" ~
ln -sfv "$DOTFILES_DIR/.tmux.conf" ~
ln -sfv "$DOTFILES_DIR/.vim" ~
ln -sfv "$DOTFILES_DIR/.vimrc" ~
ln -sfv "$DOTFILES_DIR/.xinitrc" ~
ln -sfv "$DOTFILES_DIR/.xmodmap" ~
ln -sfv "$DOTFILES_DIR/.Xresources" ~
ln -sfv "$DOTFILES_DIR/.zshrc" ~
ln -sfv "$DOTFILES_DIR/.zshenv" ~
ln -sfv "$DOTFILES_DIR/.oh-my-zsh" ~
ln -sfv "$DOTFILES_DIR/.scripts" ~
ln -sfv "$DOTFILES_DIR/.Xresources" ~/.Xdefaults

ln -s "$CONFIG_DIR/awesome" ~/.config/
ln -s "$CONFIG_DIR/nvim" ~/.config/
ln -s "$CONFIG_DIR/tmux" ~/.config/
ln -s "$CONFIG_DIR/chromium-flags.conf" ~/.config/
ln -s "$CONFIG_DIR/alacritty" ~/.config/
ln -s "$CONFIG_DIR/sway" ~/.config/
ln -s "$CONFIG_DIR/waybar" ~/.config/
ln -s "$CONFIG_DIR/mako" ~/.config/
ln -s "$CONFIG_DIR/ranger" ~/.config/
