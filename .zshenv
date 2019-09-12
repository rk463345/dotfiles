if test -z "${XDG_RUNTIME_DIR}"; then
	export XDG_RUNTIME_DIR=/tmp/${UID}-runtime-dir
	if ! test -d "${XDG_RUNTIME_DIR}"; then
		mkdir "${XDG_RUNTIME_DIR}"
		chmod 0700 "${XDG_RUNTIME_DIR}"
	fi
fi

if test -z "${XDG_CONFIG_HOME}"; then
	export XDG_CONFIG_HOME="${HOME}/.config"
fi

# Path to your oh-my-zsh installation.
export ZSH=/home/beerbin/.oh-my-zsh
export PATH=/home/beerbin/.scripts:/home/beerbin/bin:/home/beerbin/.local/bin:$PATH

export EDITOR=nvim
export PAGER=less

export LANG="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

export MOZ_USE_XINPUT2=1 # Pixel-perfect trackpads <3
export MOZ_ENABLE_WAYLAND=1

export IBUS_ENABLE_CTRL_SHIFT_U=1
export XMODIFIERS=@im=ibus

# This hack necessary for reasons I'll never understand. Under Wayland specifically,
# GTK themes are evidently only configured through envvars? Whatever, this fixes it.
export GTK_THEME=$(cat ~/.config/gtk-3.0/settings.ini | grep gtk-theme-name | cut -d'=' -f2)
export GTK_CSD=0
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export GTK_IM_MODULE=ibus
export GDK_BACKEND=wayland

export QT_QPA_PLATFORM=wayland-egl
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_IM_MODULE=ibus

export XDG_CURRENT_DESKTOP=Unity

export SSH_AUTH_SOCK

