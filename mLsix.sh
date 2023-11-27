#!/bin/bash
 trap 'echo -en "\ec"; stty sane; exit' SIGINT
 aa=0
 A(){ for b in $(seq 0 10);do E${b};done; }
 B()
{
  local c
  IFS= read -s -n1 c 2>/dev/null >&2
  if [[ $c = $(echo -en "\e") ]]; then
    read -s -n1 c 2>/dev/null >&2
    if [[ $c = \[ ]]; then
      read -s -n1 c 2>/dev/null >&2
      case $c in
        A) echo d ;;
        B) echo e ;;
        C) echo f ;;
        D) echo g ;;
      esac
    fi
  elif [[ "$c" == "$(echo -en \\x0A)" ]]; then
    echo enter
  fi
}
 C()
{
 if [[ $i == d ]];then ((aa--));fi
 if [[ $i == e ]];then ((aa++));fi
 if [[ $aa -lt 0  ]];then aa=10;fi
 if [[ $aa -gt 10 ]];then aa=0;fi;
}

 D()
{
 j1=$((aa+1)); k1=$((aa-1))
 if [[ $k1 -lt 0   ]];then k1=10;fi
 if [[ $j1 -gt 10 ]];then j1=0;fi
 if [[ $aa -lt $aa ]];then echo -en "\e[0m";E$k1;else echo -en "\e[0m";E$j1;fi
 if [[ $j1 -eq 0   ]] || [ $k1 -eq 10 ];then
 echo -en "\e[0m" ; E$k1; E$j1;fi;echo -en "\e[0m";E$k1;E$j1;
}
 TXa()
{
 for (( a=2; a<=24; a++ ))
  do
   echo -e "\e[${a};1H\e[47;30m│\e[0m                                                                                \e[47;30m│\e[0m"
  done
 echo -en "\e[1;1H\033[0m\033[47;30m┌────────────────────────────────────────────────────────────────────────────────┐\033[0m";
 echo -en "\e[3;3H\e[1m *** lsix ***\e[0m";
 echo -en "\e[4;1H\e[47;30m├\e[0m────────────────────────────────────────────────────────────────────────────────\e[0m\e[47;30m┤\e[0m";
 echo -en "\e[5;3H\e[2m Lsix - это простая утилита CLI, разработанная, чтобы отображать миниатюры\e[0m";
 echo -en "\e[6;3H\e[2m изображений в терминале с использованием графики Sixel.\e[0m";
 echo -en "\e[7;1H\e[47;30m├\e[0m────────────────────────────────────────────────────────────────────────────────\e[0m\e[47;30m┤\e[0m";
 echo -en "\e[8;3H\e[2m Установка\e[0m                                                          \e[36m Install\e[0m";
 echo -en "\e[9;3H\e[2m lsix не требует установки, так как это всего лишь скрипт BASH.\e[0m";
 echo -en "\e[14;1H\e[47;30m├\e[0m────────────────────────────────────────────────────────────────────────────────\e[0m\e[47;30m┤\e[0m";
 echo -en "\e[20;1H\e[47;30m├\e[0m────────────────────────────────────────────────────────────────────────────────\e[0m\e[47;30m┤\e[0m";
 echo -en "\e[22;1H\e[47;30m├\e[0m─ \xE2\x86\x91 Up ───── \xE2\x86\x93 Down ──── \xe2\x86\xb2 Select Enter ────────────────────────────────────────\e[0m\e[47;30m┤\e[0m";
 echo -en "\e[25;1H\033[0m\033[47;30m└────────────────────────────────────────────────────────────────────────────────┘\033[0m";
}
  E0(){ echo -en "\e[10;3H Загрузите последнюю версию lsix со страницы проекта на github               ";}
  E1(){ echo -en "\e[11;3H Распакуйте скачанный архив                                                  ";}
  E2(){ echo -en "\e[12;3H Скопируйте двоичный файл lsix в ваш каталог                                 ";}
  E3(){ echo -en "\e[13;3H Сделайте двоичный файл lsbix исполняемым                                    ";}
  E4(){ echo -en "\e[15;3H Запуск lsix в xterm                                                         ";}
  E5(){ echo -en "\e[16;3H Конфигурация xterm                                             \e[32m .Xresources \e[0m";}
  E6(){ echo -en "\e[17;3H Просмотр миниатюрных изображений в терминале                                ";}
  E7(){ echo -en "\e[18;3H Возможности                                                                 ";}
  E8(){ echo -en "\e[19;3H Дополнение                                                                  ";}
  E9(){ echo -en "\e[21;3H                                                                        \e[36m Git \e[0m";}
 E10(){ echo -en "\e[23;3H                                                                       \e[34m Exit \e[0m";}
 INI(){ echo -en "\ec" ;stty sane;TXa;A; };INI
 while [[ "$l1" != " " ]]; do case $aa in
  0)D;echo -en "\e[47;30m"; (E0);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "\e[32m
  wget https://github.com/hackerb9/lsix/archive/master.zip
\e[0m";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  1)D;echo -en "\e[47;30m"; (E1);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "\e[32m
 unzip master.zip
\e[0m";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  2)D;echo -en "\e[47;30m"; (E2);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "\e[32m
 sudo cp lsix-master/lsix /usr/local/bin/
\e[0m";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  3)D;echo -en "\e[47;30m"; (E3);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "\e[32m
  sudo chmod +x /usr/local/bin/lsix
\e[0m";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  4)D;echo -en "\e[47;30m"; (E4);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "\e[32m
 xterm -ti vt340
\e[0m";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  5)D;echo -en "\e[47;30m"; (E5);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Кроме того, вы можете сделать vt340 типом терминала по умолчанию для Xterm.
 Отредактируйте файл .Xresources Добавьте следующую строку:
\e[32m xterm*decTerminalID : vt340
\e[0m";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  6)D;echo -en "\e[47;30m"; (E6);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Показать миниатюру:                        \e[32m lsix logo.png\e[0m
 Показать все миниатюры:                    \e[32m lsix\e[0m
 Показать все миниатюры по расширению файла:\e[32m lsix *.png\e[0m
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  7)D;echo -en "\e[47;30m"; (E7);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 1. Автоматически определяет, поддерживает ли ваш терминал графику Sixel или нет.
 Если ваш терминал не поддерживает Sixel, она уведомит вас о ее включении.
 2. Автоматически определяет цвет фона терминала. Она использует
 escape-последовательности терминала, чтобы попытаться выяснить основной
 и фоновый цвета вашего терминала и четко отобразить миниатюры.
 3. Если в каталоге много изображений, обычно больше 21, lsix будет выводить эти
 изображения по одной строке за раз, поэтому вам не нужно ждать,
 пока будет созданы все миниатюры.
 4. Хорошо работает по SSH, поэтому вы можете без проблем управлять изображениями,
 хранящимися на вашем удаленном веб-сервере.
 5. Поддерживает не растровую графику, такую как.svg, .eps, .pdf, .xcf и т. д.
 6. Написана на BASH, поэтому работает практически во всех дистрибутивах Linux.
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  8)D;echo -en "\e[47;30m"; (E8);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Поскольку lsix использует ImageMagick, убедитесь, что вы установили его.
 Он доступен в репозиториях по умолчанию в большинстве дистрибутивов Linux.
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  9)D;echo -en "\e[47;30m"; (E9);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 mLsix Описание утилиты lsix.
 asciinema:  \e[36m https://asciinema.org/a/623568\e[0m
 codeberg:   \e[36m https://codeberg.org/Grannik/mLsix\e[0m
 github:     \e[36m \e[0m
 gitlab:     \e[36m \e[0m
 sourceforge:\e[36m \e[0m
 notabug:    \e[36m \e[0m
 bitbucket:  \e[36m \e[0m
 gitea:      \e[36m \e[0m
 gogs:       \e[36m \e[0m
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 10)D;echo -en "\e[47;30m";(E10);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;exit 0;fi;;
esac;C;done
