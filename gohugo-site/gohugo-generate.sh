run=1
while [ $run -gt 0 ]; do
echo ----------run----------
err=$(hugo -D 2>&1 > /dev/null)
echo ----------err----------
echo "$err"
run=0
IFS=$'\n'
for line in $err
do
echo ----------line----------
echo "$line"
parse_page_metadata=$(echo "$line" | sed -n 's/^.*Error: failed to parse page metadata for "\(.*\)".*/\1/p')
if [ x"$parse_page_metadata"y != "xy" ]; then
echo ----------file----------
echo "$parse_page_metadata"
rm content/"$parse_page_metadata"
run=1
fi
done
done
