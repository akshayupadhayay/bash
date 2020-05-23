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




