for f in {1..99..2}
do
    echo "$f"
done
=>1 3 5 7 9...99


read X
read Y
echo $(($X+$Y))
echo $(($X-$Y))
echo $(($X*$Y))
echo $(($X/$Y))


FILELIST=`ls -la`
echo $FILELIST



FileWithTimeStamp=/tmp/my-dir/file_$(/bin/date +%Y-%m-%d).txt
echo $FileWithTimeStamp
=> /tmp/my-dir/file_2020-05-22.txt



BIRTHDATE="Jan 1, 2020"
BIRTHDAY=`date -d "$BIRTHDATE" +%A`
echo $BIRTHDAY
=> Wednesday
