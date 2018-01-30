run=1
while [ $run -gt 0 ]; do
echo --------------------
err=$(hugo -D 2>&1)
echo "$err"
run=0
for line in "$err"
do
echo "$line"
parse_page_metadata=$(echo "$line" | sed -n 's/^Error: Error building site: failed to parse page metadata for "\(.*\)".*/\1/p')
if [ x"$parse_page_metadata"y != "xy" ]; then
echo "$parse_page_metadata"
rm content/"$parse_page_metadata"
run=1
fi
done
done
