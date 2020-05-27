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


#Tail command - last 20 lines of file
cat </dev/stdin | tail -n 20
cat </dev/stdin | tail -c20 # last 20 characters



#tr command - In a given fragment of text, replace all parentheses ()   with box brackets [] .
tr "()" "[]"
#OR
echo "abc" | tr "a-z" "A-Z"*
=>ABC


#tr command - In a given fragment of text, delete all the lowercase characters.
tr -d "a-z"

#tr command - In a given fragment of text, replace all sequences of multiple spaces with just one space.
tr -s " "


#sort command - Given a text file order lines
cat </dev/stdin | sort        #alphabetical order - lexicographical
cat </dev/stdin | sort -r     #reverse alphabetical order
cat </dev/stdin | sort -n     #numeric ascending inclusive decimals
cat </dev/stdin | sort -rn    #numeric descending inclusive decimals

# sort command - Rearrange the rows of the table in descending order of the values for the average temperature (2nd column)
# Albany, N.Y.    22.2    46.6    71.1    49.3    38.60    136    64.4    57
# Albuquerque, N.M.    35.7    55.6    78.5    57.3    9.47    60    11.0    64
# Anchorage, Alaska    15.8    36.3    58.4    34.1    16.08    115    70.8    39 / 60
cat </dev/stdin | sort -t$'\t' -k 2 -rn  #-t option to specify the delimeter
cat </dev/stdin | sort -t$'\t' -k 2 -n   #ascending 2nd column
cat </dev/stdin | sort -t$'|' -k 2 -rn   #descending 2nd column, pipe delimeter



#uniq command - Given a text file, count the number of times each line repeats itself. Only consider consecutive repetitions. Display the space separated count and line, respectively. There shouldn't be any leading or trailing spaces.
uniq -c | sed 's/^ *//'
uniq -c -i | sed 's/^ *//'   #ignore case sensitive (aa AA aA are all same)


#uniq command - Given a text file, display only those lines which are not followed or preceded by identical replications.
uniq -u  #       Don't output lines that are repeated in the input.Print only lines that are unique in the INPUT.



#paste command - You are given a CSV file where each row contains the name of a city and its state separated by a comma. Merge all lines from newline by tab
paste -s                              #merge all lines separated by tab
cat </dev/stdin | paste - - -         #merge 3 lines at a time
cat </dev/stdin | paste -s -d ';'     #replace the newlines in the file with semicolons
cat </dev/stdin | paste - - - -d ';'  #merge 3 lines at a time & replace the '\n' with ';'


#array command - Display the entire array of country names and replace '\n' with a space between each of them.
arr=$(cat)
echo ${arr[@]}      #all elements
echo ${arr[3]}      #3rd element
echo ${#arr[@]}     #length of array

#array command -  slice the array and display only the elements lying between positions 3 and 7, both inclusive.
arr=($(cat))
echo ${arr[@]:3:5}

#array command - filter out (remove) all the names containing the letter 'a' or 'A' from array.
arr=($(cat))
pattern=( ${arr[@]/*[aA]*/} )
echo ${pattern[@]}


#The first capital letter (if present) in each element of the array should be replaced with a dot ('.').
echo ${arr[@]/[A-Z]/.}      


#array command - contatenate array 3 times and print with space separated.
arr=($(cat))
newarr=("${arr[@]}" "${arr[@]}" "${arr[@]}")
echo ${newarr[@]}


#array command - Find unique element in array
# 5           -> Input
# 0 0 1 2 1
# =>2
read
arr=($(cat))
arr=${arr[@]}
echo $((${arr// /^}))

#Explanation
# arr=($(cat)) -> reads in the array
# arr=${arr[*]} -> render a new variable of type string from the merging of the array arr delimited by space, i.e., from [1,2,2,2,1] to "1 2 2 2 1"
# ${arr// /^} -> replaces all spaces ' ' in the string variable with ^ (bitwise-XOR operator),i.e., we get "1^2^2^2^1"
# $((exp)) -> evaluates the expression "exp" by performing arithmetic operations, here "exp" => ${arr// /^}. Thus ^ is treated as arithmetic operator and the string is evaluated sequentially form left to right.
# We get, 1^2^2^2^1 = 3^2^2^1 = 1^2^1 = 3^1 = 2 (Lonely Integer)

#OR

read
echo $((`tr ' ' '^'`))


#awk command - identify whether each of the students has passed or failed.
#A student is considered to have passed if (s)he has a score  or more in each of the three subjects.
awk '{print $1,":", ($2<50||$3<50||$4<50) ? "Fail" : "Pass"}'


#awk command - Your task is to identify those lines that do not contain all three scores for students.
# A 25 27 50
# B 35 75
# C 75 78 
# D 99 88 76
awk '{if (NF < 4){print "Not all scores are available for "$1}}'
# => Not all scores are available for B
# => Not all scores are available for C


#awk command - Your task is to identify the performance grade for each student. If the average of the three scores is 80 or more, the grade is 'A'. If the average is 60 or above, but less than 80, the grade is 'B'. If the average is 50 or above, but less than 60, the grade is 'C'. Otherwise the grade is 'FAIL'.
# https://www.hackerrank.com/challenges/awk-3/problem
awk '{avg=($2+$3+$4)/3; print $0, ":", (avg<50)?"FAIL":(avg<80)?"B":"A"}'


#awk command - Concatenate every 2 lines of input with a semi-colon.
# https://www.hackerrank.com/challenges/awk-4/problem
awk 'ORS=NR%2?";":"\n"'
# ORS stands for Output Record Separator. And NR is Number of Record (or just current line number). ORS and NR are just variables and you can do with them what you want. There are also useful FS, OFS, RS, NF, FILENAME, FNR. See http://www.thegeekstuff.com/2010/01/8-powerful-awk-built-in-variables-fs-ofs-rs-ors-nr-nf-filename-fnr/


#grep command - Output only those lines that contain the word 'the'.
cat </dev/stdin | grep -w 'the'     #-w: pattern search whole word
cat </dev/stdin | grep -iw "the"    #case insensitive


#grep command -Output only those lines that not contain the word 'that'.
grep -viw 'that'
# -v   : Invert the sense of matching
# -i   : Ignore case distinctions
# -w   : Match only those lines containing the whole word


#grep command - We retain only those lines which have at least one of the following words: the, that, then, those.
cat </dev/stdin | grep -iw 'that\|the\|then\|those'


#grep command - grep out and output only those credit card numbers which have two or more consecutive occurences of the same digit.
#https://www.hackerrank.com/challenges/text-processing-in-linux-the-grep-command-5/problem
cat </dev/stdin | grep '\([0-9]\) *\1'


#sed command - For each line in a given input file, transform the first occurrence of the word 'the' with 'this'. The search and transformation should be strictly case sensitive.
sed 's/\bthe\b/this/'


#sed command - For each line in a given input file, transform all the occurrences of the word 'thy' with 'your'. The search should be case insensitive, i.e. 'thy', 'Thy', 'tHy' etc. should be transformed to 'your'.
sed 's/thy/your/ig'


#sed command - Given an input file, in each line, highlight all the occurrences of 'thy' by wrapping them up in brace brackets. The search should be case-insensitive.
sed -e 's/thy/{&}/ig'
#OR
sed -e 's/[tT]hy/{&}/g'


#sed command - Given n lines of credit card numbers, mask the first 12 digits of each credit card number with an asterisk (i.e., *) and print the masked card number on a new line. Each credit card number consists of four space-separated groups of four digits. For example, the credit card number 1234 5678 9101 1234 would be masked and printed as **** **** **** 1234.
sed 's/[0-9]\+ /**** /g'


#sed command - Given an input file, with N credit card numbers, each in a new line, your task is to reverse the ordering of segments in each credit card number. 
# 1234 5678 9101 1234
#=> 1234 9101 5678 1234
sed -r 's/(.+ )(.+ )(.+ )(....)/\4 \3\2\1/'


#Send standard output and error to logfile
2>&1 >output.log 
#means first start sending all file handle 2 stuff (standard error) to file handle 1 (standard output) then send that to the file output.log. 
#In other words, send standard error and standard output to the log file.

2>&1 | tee output.log 
#is the same with the 2>&1 bit, it combines standard output and standard error on to the standard output stream. 
# It then pipes that through the tee program which will send its standard input to its standard output (like cat) and also to the file. 
# So it combines the two streams (error and output), then outputs that to the terminal and the file.

