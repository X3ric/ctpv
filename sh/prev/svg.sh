# svg: convert

svg() {
	convert -background none "$f" -append "png:$cache_f"
}

convert_and_show_image svg
