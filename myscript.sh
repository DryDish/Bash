#! /bin/bash

# ECHO COMMAND
echo Hello, Wold!

# VARIABLES
# Uppercase by convention
# allowed: Letters, numbers, underscores
NAME="Alex"

echo "My name is $NAME"

# USER INPUT
read -p "Enter your name: " USER_NAME

# CONDITIONALS
if [ "$USER_NAME" == "Alex" ]
then 
    echo "You are not supposed to be running this!"
elif [ "$USER_NAME" == "alex" ]
then
    echo "You are not supposed to be running this either!"
else
    echo "hello $USER_NAME, nice to meet you!"
fi


#----------------------------------------------------------------------
# val1 -eq val2 Returns true if the values are equal
# val1 -ne val2 Returns true if the values are not equal
# val1 -gt val2 Returns true if val1 is greater than val2
# val1 -ge val2 Returns true if val1 is greater than or equal to val2
# val1 -lt val2 Returns true if val1 is less than val2
# val1 -le val2 Returns true if val1 is less than or equal to val2
#----------------------------------------------------------------------

# COMAPRISON
NUM1=3
NUM2=5

if [ "$NUM1" -gt "$NUM2" ]
then 
    echo "$NUM1" is greater than "$NUM2"
elif [ "$NUM1" -lt "$NUM2" ]
then
    echo "$NUM1" is less than "$NUM2"
fi

#----------------------------------------------------------------------
# -d file   True if the file is a directory
# -e file   True if the file exists (note that this is not particularly portable, thus -f is generally used)
# -f file   True if the provided string is a file
# -g file   True if the group id is set on a file
# -r file   True if the file is readable
# -s file   True if the file has a non-zero size
# -u        True if the user id is set on a file
# -w        True if the file is writable
# -x        True if the file is an executable
#----------------------------------------------------------------------

# FILE CONDITIONS
FILE="treecreate_eer.mwb"

if [ -f $FILE ]
then
    echo "$FILE is a file"
else
    echo "$FILE is not found here"
fi


# CASE STATEMENT
read -p "Are you over 18? Y/N " ANSWER
case "$ANSWER" in 
    [yY] | [yY][eE][sS])
        echo "You may buy alcohol."
        ;;
    [nN] | [nN][oO])
        echo "Sorry, you must be over 18 to buy alcohol."
        ;;
    *)
        echo "input '$ANSWER' is invalid, please enter y/yes or n/no"
        ;;
esac


# FOR EACH LOOP
NAMES="Alex Bob Alice Tom"
for NAME in $NAMES
    do
        echo "Hello $NAME"
done


# FOR EACH LOOP TO RENAME FILES
FILES=$(ls *.txt) # Grab all .txt file names and put them into the FILES variable
NEW="new"
for FILE in $FILES
    do 
        if [[ $FILE == *"new"* ]]
        then
            echo "$FILE was previously renamed already."
            echo "Renaming $FILE to" "${FILE//[!0-9]/}.txt"
            mv $FILE ${FILE//[!0-9]/}.txt
        else
            echo "Renaming $FILE to new-$FILE"
            mv $FILE $NEW-$FILE
        fi
done

# WHILE LOOP - READ THROUGH A FILE LINE BY LINE
LINE=1
while read -r CURRENT_LINE
    do 
        echo "$LINE: $CURRENT_LINE"
            ((LINE++))
done < "./lines_to_read"

# FUNCTION DECLARATION
function say_hello() 
{
    echo "Hello from Function!"
}

# FUNCTION CALL
say_hello

# FUNCTION WITH PARAMS
function greet()
{
    echo "Hello i am function with params"
    echo "Param 1: $1 and param 2: $2"
}

# CALLING FUNCTION WITH PARAMS
greet "peter" "alice"