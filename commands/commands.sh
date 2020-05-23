#loops
for f in {1..99..2}
do
    echo "$f"
done
=>1 3 5 7 9...99

#maths
read X
read Y
echo $(($X+$Y))
echo $(($X-$Y))
echo $(($X*$Y))
echo $(($X/$Y))

#comparison
read X
read Y
if [ $X -lt $Y ]
then
    echo "X is less than Y"
elif [ $X -gt $Y ]
then
    echo "X is greater than Y"
elif [ $X -eq $Y ]
then
    echo "X is equal to Y"
fi


#assign output to variable
FILELIST=`ls -la`
echo $FILELIST


#output based on user input
read INPUT
[[ $INPUT = [Yy] ]] && echo "YES" || echo "NO"


#create filename runtime
FileWithTimeStamp=/tmp/my-dir/file_$(/bin/date +%Y-%m-%d).txt
echo $FileWithTimeStamp
=> /tmp/my-dir/file_2020-05-22.txt


#extract day from date
BIRTHDATE="Jan 1, 2020"
BIRTHDAY=`date -d "$BIRTHDATE" +%A`
echo $BIRTHDAY
=> Wednesday


#pass numeric formula to bc command and print 3 decimal
read NUMBER
echo $NUMBER | bc -l | xargs printf "%.3f"
=> 5+50*3/20 + (19*2)/7 => 17.929


#input N number and find average upto 3 decimal
read number
arr=($(cat))
arr=${arr[*]} #1,2,3,4 => "1 2 3 4"
printf "%.3f" $(echo $((${arr// /+}))/$number |bc -l)
=> 4 1 2 9 8 => 5.000


#Cut command - cut 3rd char from a text file with 100 sentence
input="/path/file.txt"
while IFS= read -r line
do
  echo "$line"
done < "$input"
N=$(<$input) #OR N=`cat $input`
cut -c3 $N


#Cut command - cut 2nd & 7th char from a text file with 100 sentence
input="/path/file.txt"
while IFS= read -r line
do
  echo "$line"
done < "$input"
N=$(<$input) #OR N=`cat $input`
cut -c2,7 $N


#Cut command - cut from 2nd till 7th both inclusive from file.txt
while read LINE
do
    echo $LINE | cut -c2-7
done


#Cut command - Given a tab delimited file with several columns (tsv format) print the first three fields
cut -f1-3 #tab is a defualt delimeter
cut -f1,3 #1st & 3rd fields


#Cut command - cut from 13th till end of line
while read LINE
do
    echo $LINE | cut -c13-
done


#Cut command - Given a sentence, identify and display its fourth word. Assume that the space (' ') is the only delimiter between words.
cut -d ' ' -f4


#Cut command - Given a sentence, identify and display its first three words. Assume that the space (' ') is the only delimiter between words.
cut -d ' ' -f1-3


#Cut command - Given a tab delimited file with several columns (tsv format) print the fields from second fields to last field.
cut -f2-


#Head command - Display the first 20 lines of an input file.
head -20 </dev/stdin
#OR
cat | cut -d$'\n' -f -20


#Head command - Display the first 20 characters of an input file
cat | head -c20 </dev/stdin


#Head command - Display the lines (from line number 12 to 22, both inclusive) of a given text file.
cat </dev/stdin | head -n 22 | tail -n +12 #12th line inclusive
cat </dev/stdin | head -n 22 | tail -n 12  #12th line exclusive 


