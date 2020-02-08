#!/usr/bin/bash
shopt -s extglob

tablesList=($(ls ~/meyasql/$databaseName))
#Question here [[]]
if [[ ${#tablesList[@]} != 0 ]]; then
    echo -n "enter the name of table from ( ${tablesList[@]} ) :  "
    read tableName

    if [ -f "$HOME/meyasql/$databaseName/$tableName" ]; then

    colNo=`wc -l ~/meyasql/$databaseName/.$tableName | cut -d " " -f 1` 
    newRecord=""
for (( c=1; c<=$colNo; c++ ))
do  
    result=`sed -n "$c p" ~/meyasql/$databaseName/.$tableName`
    fieldName=`echo $result | cut -d ":" -f 1`
    dataType=`echo $result | cut -d ":" -f 2`
    case $dataType in
    "integer")
      echo "enter the value of ($fieldName) with data type ($dataType)"
      read data
      re='^[0-9]+$'
      while ! [[ $data =~ $re ]] 
      do
        echo "wrong input "
        echo "enter the value of ($fieldName) with data type ($dataType)"
        read data
      done
      newRecord=$newRecord$data":"
    ;;
    "string")
        echo "enter the value of ($fieldName) with data type ($dataType)"
        read data
        re='^[^:]*$'
        while ! [[ $data =~ $re ]] 
      do
        echo "wrong input "
        echo "enter the value of ($fieldName) with data type ($dataType)"
        read data
      done
      newRecord=$newRecord$data":"
    ;;
    esac
done
echo ${newRecord::1} >> ~/meyasql/$databaseName/$tableName
echo "new record inserted"

   . ./tableManger.sh

    else
    echo "This table doesnot exist .. !!!"
    . ./tableManger.sh
    fi
else
    echo -e "\n there is no table to insert into !!! \n";
    . ./tableManager.sh
fi








