CC = gcc
FLAGS =-Wall -Wextra -Werror

all: s21_grep rebuild test clang clean

s21_grep: clean
	$(CC) $(FLAGS) s21_grep.c -o s21_grep

test: clean
	bash test_grep.sh

clean:
	rm -rf *.o s21_grep

rebuild: clean s21_grep

clang:
	clang-format -n *.c *.h

.PHONY: s21_grep clean rebuild clang test
