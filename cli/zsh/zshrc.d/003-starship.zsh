# Starship theme configuration is available at <repo>/cli/starship/starship.toml

if ! type starship > /dev/null; then
	echo "Starship is not installed. Learn more at"
	echo "  https://starship.rs/guide"
	return 0
fi
eval $(starship init zsh)
