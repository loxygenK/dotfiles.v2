function duration() {
	local duration=$(( ($2 - $1) * 1000 ))
	local duration_int=$(( $( printf "%d" $duration ) ))
	
	if [ $duration_int -le 10 ]; then
		echo -ne "\e[38;5;10m"
	elif [ $duration_int -le 30 ]; then
		echo -ne "\e[38;5;245m"
	elif [ $duration_int -le 100 ]; then
		echo -ne "\e[38;5;11m"
	else
		echo -ne "\e[38;5;9m"
	fi

	printf "%3.2f ms\e[m\n" $duration
}

if [ ! -d "$F4N_DOTFILES_LOCATION" ]; then
	echo "\e[38;5;1;1m[ FATAL ERROR ] \$F4N_DOTFILES_LOCATION IS NOT SET PROPERLY"
	echo "  \$F4N_DOTFILES_LOCATION = $F4N_DOTFILES_LOCATION"
	echo "  This path does not exist, or the environment variable is not set properly."
	echo ""
	echo "  No configuration is read. Try re-sourcing '$0' after setting \$F4N_DOTFILES_LOCATION properly\e[m"
	return 1
fi

base=$F4N_DOTFILES_LOCATION/cli/zsh/zshrc.d

echo -e "\e[38;5;6;1mLoading from directory $base\e[m"
for file in $(find $base -type f  | sort); do
	echo -ne "  \e[38;5;6m Loading \e[1m$(realpath --relative-to="$base" $file) \e[m"
	start=$(date +%s.%N)
	time source $file
	end=$(date +%s.%N)
	echo -ne "\e[38;5;245m- Took "
	duration $start $end
done
echo -e "\e[38;5;2mLoaded! \e[m"
