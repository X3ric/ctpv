# font: fontimage

font() {
    local TMP_IMAGES=()
	INDEX=0
    SIZES=("40" "37" "34" "31")
    PREVIEW_TEXT=(
        "$(basename "$f")"
        "!#$%&'()*+,-./0123456789;:<=>?@[]^_{|}~"
        "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        "abcdefghijklmnopqrstuvwxyz"
    )
    FONTNAME=$(basename "$f")
    COLORS=($(cat ~/.cache/wal/colors))
    for SIZE in "${SIZES[@]}"; do
        ((INDEX++))
        TMP_IMAGE="/tmp/${FONTNAME}${SIZE}.png"
        TMP_IMAGES+=("$TMP_IMAGE")
        FONT_COLOR="${COLORS[$((INDEX + 1))]:-white}"
        convert \
            -size 1000x"$SIZE" \
            -background none \
            -gravity Center \
            -fill "$FONT_COLOR" \
            -font "$f" \
            -pointsize "$SIZE" \
            label:"${PREVIEW_TEXT[$INDEX]}" \
            "png:$TMP_IMAGE" >/dev/null 2>/dev/null
    done
	rm $cache_f >/dev/null 2>/dev/null || true
    convert -background none "${TMP_IMAGES[@]}" -append "png:$cache_f"
}

convert_and_show_font() {
	setup_image
	$1 || exit "$?"
	send_image "$cache_f"
}

convert_and_show_font font
