size="125x125"

rm -r thumbnails
mkdir thumbnails

for pic in orig/*
do
  rot=$(($(shuf -i 0-4 -n 1) - 2))
  base=$(basename $pic ".jpg")
  convert $pic -thumbnail $size^ -gravity center -extent $size $base.png

  convert $base.png -bordercolor snow -background black -polaroid $rot \
    $base.png

done

mv *.png thumbnails
