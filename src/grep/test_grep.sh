#!/bin/bash
SUCCESS=0
FAIL=0
COUNTER=0
DIFF_RES=""

declare -a flags=(
    "i"
    "v"
    "c"
    "l"
    "n"
    "h"
    "s"
    "o"
)

function test() {
    mkdir log/
    ./s21_grep $FLAGS $FILE > log/s21_grep.log
    grep $FLAGS $FILE > log/sys_grep.log
    DIFF_RES="$(diff -s log/s21_grep.log log/sys_grep.log)"
    (( COUNTER++ ))
    if [ "$DIFF_RES" == "Files log/s21_grep.log and log/sys_grep.log are identical" ]
    then
        (( SUCCESS++ ))
        echo -e "№$COUNTER SUCCESS:\033[32m $SUCCESS \033[0mFAILS: \033[31m$FAIL\033[0m"
    else
        (( FAIL++ ))
        echo -e "№$COUNTER SUCCESS:\033[32m $SUCCESS \033[0mFAILS: \033[31m$FAIL \033[0m"
        echo "$FLAGS $FILE"
    fi
    rm -rf log/
}

make s21_grep
clear

echo "------------TESTS------------"

FILE="test/test_grep.txt -e int"
for f1 in "${flags[@]}"
do
    FLAGS="-$f1"
    test
done

FILE="test/test_grep.txt -f test/test_patterns_grep.txt"
for f1 in "${flags[@]}"
do
    for f2 in "${flags[@]}"
    do
        if [ $f1 != $f2 ]
        then
            FLAGS="-$f1$f2"
            test
        fi
    done
done

echo "-------------THE-END-------------"
echo -e "FAIL: \033[31m$FAIL\033[0m"
echo -e "SUCCESS: \033[32m$SUCCESS\033[0m"

rm s21_grep