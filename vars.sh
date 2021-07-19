#!/bin/bash

a=10

echo $a

#command subst

No_of_Users=$(who |wc -l)
echo Number of users $No_of_Users

#Date with command substitution

DATE=$(date +%F)

echo Welcome ,Today date is $DATE

# It is jst for checking .
