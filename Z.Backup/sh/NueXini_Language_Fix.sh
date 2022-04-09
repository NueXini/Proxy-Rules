#!/bin/bash
# Create By NueXini

#cd feeds/NueXini_Packages

PATH_1="$({ find -type d|grep "zh-cn"; } 2>"/dev/null")"

for a in ${PATH_1}
do
    PATH_2="$({ dirname $a; } 2>"/dev/null")"
    PATH_3="$PATH_2/zh_Hans"
    #ln -s ${a} ${PATH_3}
    ln -s zh-cn ${PATH_3}
done

