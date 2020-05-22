FILELIST=`ls -la`
echo $FILELIST


FileWithTimeStamp=/tmp/my-dir/file_$(/bin/date +%Y-%m-%d).txt
echo $FileWithTimeStamp
=> /tmp/my-dir/file_2020-05-22.txt


BIRTHDATE="Jan 1, 2020"
BIRTHDAY=`date -d "$BIRTHDATE" +%A`
echo $BIRTHDAY
=> Wednesday
