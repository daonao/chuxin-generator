run=1
while [ $run -gt 0 ]; do
echo ----------run----------
out=$(hugo -DEF 2> /dev/null)
echo ----------err----------
echo "$err"
run=0
IFS=$'\n'
for line in $out
do
echo ----------line----------
echo "$line"
parse_page_metadata=$(echo "$line" | sed -n "s/^ERROR [0-9/]\+ [0-9:]\+ Failed to parse date '[0-9-]\+ [0-9:]\+' in page //p")
if [ x"$parse_page_metadata"y != "xy" ]; then
echo ----------file----------
echo "$parse_page_metadata"
rm content/"$parse_page_metadata"
run=1
fi
done
done
