#!/usr/bin/bash


tablesList=($(ls ~/meyasql/$databaseName))

echo -n "enter the name of table to show from ( ${tablesList[@]}  ) :  "
read tableName
while [ ! -f ~/meyasql/$databaseName/$tableName ]
do
echo -n "table doesnot exist!!!"
echo -n "enter the name of table to show from ( ${tablesList[@]}  ) :  "
read tableName
done
echo -n "enter the number of record you want to delete from  ( $tableName  ) :  "
read recodNo
#rm -f temp
# awk -F:  -v val="$recodNo" 'BEGIN{c=1}{if(val!=c) print $0; c=c+1}' $tableName  >> temp  
# cat temp > $tableName

sed -i "$recodNo d" ~/meyasql/$databaseName/$tableName
. ./tableManager.sh