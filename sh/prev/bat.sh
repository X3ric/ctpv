# text: bat

if exists bat; then
	batcmd=bat
elif exists batcat; then
	batcmd=batcat
else
	exit 127
fi

cat < "$f" | highlight -O ansi -C "${f}" | "$batcmd" \
	--style plain         \
	--paging never        \
	--terminal-width "$w" \
	--wrap character      \
