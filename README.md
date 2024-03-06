# Simple Bash Utils

Разработка утилит Bash по работе с текстом: cat, grep.

### сat Использование

Команда `cat` - это одна из самых часто используемых команд Linux. Она часто применяется опытными пользователями во время работы с терминалом. С помощью этой команды можно очень просто посмотреть содержимое небольшого файла, склеить несколько файлов и многое другое.

`cat [OPTION] [FILE]...`

### cat Опции

| № | Опции | Описание |
| ------ | ------ | ------ |
| 1 | -b (GNU: --number-nonblank) | нумерует только непустые строки |
| 2 | -e предполагает и -v (GNU only: -E то же самое, но без применения -v) | также отображает символы конца строки как $  |
| 3 | -n (GNU: --number) | нумерует все выходные строки |
| 4 | -s (GNU: --squeeze-blank) | сжимает несколько смежных пустых строк |
| 5 | -t предполагает и -v (GNU: -T то же самое, но без применения -v) | также отображает табы как ^I |

### grep Использование

Команда `grep` дает очень много возможностей для фильтрации текста. Вы можете выбирать нужные строки из текстовых файлов, отфильтровать вывод команд, и даже искать файлы в файловой системе, которые содержат определённые строки. Утилита очень популярна, потому что она уже предустановлена почти во всех дистрибутивах.

`grep [options] template [file_name]`

### grep Опции

| № | Опции | Описание |
| ------ | ------ | ------ |
| 1 | -e | Шаблон |
| 2 | -i | Игнорирует различия регистра.  |
| 3 | -v | Инвертирует смысл поиска соответствий. |
| 4 | -c | Выводит только количество совпадающих строк. |
| 5 | -l | Выводит только совпадающие файлы.  |
| 6 | -n | Предваряет каждую строку вывода номером строки из файла ввода. |
| 7 | -h | Выводит совпадающие строки, не предваряя их именами файлов. |
| 8 | -s | Подавляет сообщения об ошибках о несуществующих или нечитаемых файлах. |
| 9 | -f file | Получает регулярные выражения из файла. |
| 10 | -o | Печатает только совпадающие (непустые) части совпавшей строки. |

### Build

Сборка программ настроена с помощью Makefile'ов с соответствующими целями: `s21_cat`, `s21_grep`

1. s21_cat - запуск команды осуществляется из директории src/cat

* `make s21_cat` - Сборка программы s21_cat

2. s21_grep - запуск команды осуществляется из директории src/grep

* `make s21_grep` - Сборка программы s21_grep

3. Остальные цели:

* `make test` - Покрытие интеграционными тестами для всех вариантов флагов и входных значений
* `make clang` - Проверка кода на Google style
* `make clean` - Удаление ненужных, временных файлов
* `make rebuild` - Сборка проекта заного

### Information

* Программы разработаны на языке Си стандарта C11 с использованием компилятора gcc
* Программы представляют собой исполняемый файл с аргументами командной строки
* Сборка программ настроена с помощью Makefile с соответствующими целями: s21_cat, s21_grep  
* Интеграционное тестирование для всех вариантов флагов и входных значений, на базе сравнения с поведением реальных утилит Bash
* Программа разработана в соответствии с принципами структурного программирования
* `s21_cat`:
    * Поддержка всех флагов (включая GNU версии), указанных [выше](#cat-опции)
    * Исходные, заголовочные и сборочный файлы должны располагаются в директории src/cat/
* `s21_grep`:
    * Поддержка всех флагов, указанных [выше](#grep-опции)
    * Поддержка парных комбинаций (например, `-iv`, `-in`)
    * Для регулярных выражений использовалась библиотека regex  
    * Исходные, заголовочные и make файлы должны располагаться в директории src/grep/
