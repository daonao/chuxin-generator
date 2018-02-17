# ERROR 2018/02/17 10:09:39 Failed to parse date '2017-9-17 08:10:27' in page posts/Thinkgamer/机器学习/回归分析之理论篇.md
# ERROR 2018/02/17 10:09:39 Failed to parse date '2016-12-21 00:35' in page posts/Thinkgamer/随手记/别了青春与流年，遇见下一个自己.md
echo "ERROR 2018/02/17 10:09:39 Failed to parse date '2016-12-21 00:35' in page posts/Thinkgamer/随手记/别了青春与流年，遇见下一个自己.md" |
sed -n "s/^ERROR [0-9/]\+ [0-9:]\+ Failed to parse date '[0-9-]\+ [0-9:]\+' in page //p"

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
