if [ "$(tail -n +3 "$F4N_DOTFILES_LOCATION/cli/zsh/zshrc")" != "" ]; then
	echo "[!] Modification to ~/.zshrc was detected!"
	echo "    Move the content to somewhere suitable to keep dotfiles organized."
fi
