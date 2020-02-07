#!/usr/bin/bash
shopt -s extglob

tablesList=($(ls ~/meyasql/$databaseName))
#Question here [[]]
if [[ ${#tablesList[@]} != 0 ]]; then
    echo -n "enter the name of table from ( ${tablesList[@]} ) :  "
    read tblName

    if [ -f "/home/yahya/meyasql/$databaseName/$tblName" ]; then
    
    else
    echo "This table doesnot exist .. !!!"
    fi
else
    echo -e "\n there is no table to insert into !!! \n";
    . ./tableManager.sh
fi








