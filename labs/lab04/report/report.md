---
## Front matter
title: "Отчёт по лабораторной работе №4"
subtitle: "Дисциплина: Архитектура компьютера"
author: "Абакумов Тимофей Александрович"

## Generic otions
lang: ru-RU
toc-title: "Содержание"

## Bibliography
bibliography: bib/cite.bib
csl: pandoc/csl/gost-r-7-0-5-2008-numeric.csl

## Pdf output format
toc: true # Table of contents
toc-depth: 2
lof: true # List of figures
lot: true # List of tables
fontsize: 12pt
linestretch: 1.5
papersize: a4
documentclass: scrreprt
## I18n polyglossia
polyglossia-lang:
  name: russian
  options:
	- spelling=modern
	- babelshorthands=true
polyglossia-otherlangs:
  name: english
## I18n babel
babel-lang: russian
babel-otherlangs: english
## Fonts
mainfont: IBM Plex Serif
romanfont: IBM Plex Serif
sansfont: IBM Plex Sans
monofont: IBM Plex Mono
mathfont: STIX Two Math
mainfontoptions: Ligatures=Common,Ligatures=TeX,Scale=0.94
romanfontoptions: Ligatures=Common,Ligatures=TeX,Scale=0.94
sansfontoptions: Ligatures=Common,Ligatures=TeX,Scale=MatchLowercase,Scale=0.94
monofontoptions: Scale=MatchLowercase,Scale=0.94,FakeStretch=0.9
mathfontoptions:
## Biblatex
biblatex: true
biblio-style: "gost-numeric"
biblatexoptions:
  - parentracker=true
  - backend=biber
  - hyperref=auto
  - language=auto
  - autolang=other*
  - citestyle=gost-numeric
## Pandoc-crossref LaTeX customization
figureTitle: "Рис."
tableTitle: "Таблица"
listingTitle: "Листинг"
lofTitle: "Список иллюстраций"
lotTitle: "Список таблиц"
lolTitle: "Листинги"
## Misc options
indent: true
header-includes:
  - \usepackage{indentfirst}
  - \usepackage{float} # keep figures where there are in the text
  - \floatplacement{figure}{H} # keep figures where there are in the text
---

# Цель работы

Освоение процедуры компиляции и сборки программ, написанных на ассемблере NASM.

# Задание

**Порядок выполнения лабораторной работы**

1. Создание программы Hello world!
2. Работа с транслятором NASM
3. Работа с расширенным синтаксисом командной строки NASM
4. Работа с компоновщиком LD
5. Запуск исполняемого файла

**Задание для самостоятельной работы**

1. В каталоге ~/work/arch-pc/lab04 с помощью команды cp создайте копию файла
hello.asm с именем lab4.asm
2. С помощью любого текстового редактора внесите изменения в текст программы в
файле lab4.asm так, чтобы вместо Hello world! на экран выводилась строка с вашими
фамилией и именем.
3. Оттранслируйте полученный текст программы lab4.asm в объектный файл. Выполните
компоновку объектного файла и запустите получившийся исполняемый файл.
4. Скопируйте файлы hello.asm и lab4.asm в Ваш локальный репозиторий в каталог ~/work/study/2024-2025/"Архитектура компьютера"/arch-pc/labs/lab04/. Загрузите файлы на Github.

# Выполнение лабораторной работы

## Создание программы Hello world!

С помощью утилиты cd переместимся в каталог, в котором будем работать (рис. [-@fig:001]).

![Перемещение между директориями](image/1.png){ #fig:001 width=70% }

Создадим в текущем каталоге пустой текстовый файл hello.asm с помощью утилиты touch (рис. [-@fig:002]).

![Создание текстового файла](image/2.png){ #fig:002 width=70% }

Откроем созданный файл в текстовом редакторе gedit и вставим туда текст из Лабороторной работы(рис. [-@fig:003]).

![Работа с текстовым файлом](image/3.png){ #fig:003 width=70% }

## Работа с транслятором NASM

Превратим текст программы для вывода "Hello world!" в объектный код с помощью транслятора NASM, используя команду nasm -f elf hello.asm, ключ -f указывает транслятору nasm, что требуется создать бинарный файл в формате ELF (рис. [-@fig:004]). 

![Работа с транслятором NASM](image/4.png){ #fig:004 width=70% }

Далее проверяю правильность выполнения команды с помощью утилиты ls: действительно, создан файл "hello.o".

![Проверка правильности](image/5.png){ #fig:005 width=70% }

## Работа с расширенным синтаксисом командной строки NASM

Введём команду, которая скомпилирует файл hello.asm в файл obj.o, при этом в файл будут включены символы для отладки (ключ -g), также с помощью ключа -l будет создан файл листинга listМирный.lst (рис. [-@fig:006]). Далее проверим с помощью утилиты ls правильность выполнения команды.

![Работа с расширенным синтаксисом командной строки NASM](image/6.png){ #fig:006 width=70% }

## Работа с компоновщиком LD

Передадим объектный файл hello.o на обработку компоновщику LD, чтобы получить исполняемый файл hello (рис. [-@fig:007]). Ключ -о задает имя создаваемого исполняемого файла. Далее проверим с помощью утилиты ls правильность выполнения команды.

![Работа с компоновщиком LD](image/7.png){ #fig:007 width=70% }

Выполним следующую команду (рис. [-@fig:008]). Исполняемый файл будет иметь имя main, т.к. после ключа -о было задано значение main. Объектный файл, из которого собран этот исполняемый файл, имеет имя obj.o

![Передача объектного файла на обработку компоновщику](image/8.png){ #fig:008 width=70% }

## Запуск исполняемого файла

Запускаю на выполнение созданный исполняемый файл hello (рис. [-@fig:009]).

![Запуск исполняемого файла](image/9.png){ #fig:009 width=70% }

# Задание для самостоятельной работы

С помощью утилиты cp создаю в текущем каталоге копию файла hello.asm с именем lab4.asm (рис. [-@fig:010]).

![Создание копии файла](image/10.png){ #fig:010 width=70% }

С помощью утилиты mc открываю файл lab4.asm и вношу изменения в программу так, чтобы она выводила мои имя и фамилию. (рис. [-@fig:011]).

![Изменение програмы](image/11.png){ #fig:011 width=70% }

Компилирую текст программы в объектный файл. Затем передадим объектный файл lab4.o на обработку компоновщику LD, чтобы получить исполняемый файл lab4. Запустим исполняемый файл lab4 (рис. [-@fig:012]).

![Компиляция текста программы](image/12.png){ #fig:012 width=70% }

С помощью команд git add . и git commit добавляю файлы на GitHub, комментируя действие как добавление файлов для лабораторной работы №5. После этого отправляем файлы на сервер с помощью команды git push (рис. [-@fig:013]).

![Отправка файлов](image/13.png){ #fig:013 width=70% }

Проверим на GitHub все файлы(рис. [-@fig:014])

![Проверка файлов](image/14.png){ #fig:014 width=70% }

# Выводы

При выполнении данной лабораторной работы я освоил процедуры компиляции и сборки программ, написанных на ассемблере NASM.

