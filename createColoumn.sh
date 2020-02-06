#!/usr/bin/bash


if [ "$inputFlag" = "false" ]; then
    arrOptions=("insert new column")
else
    arrOptions=("insert new column,return")
fi

old_IFS="$IFS";
IFS=","

select choice in ${arrOptions[*]} ;
do
    IFS="${old_IFS}"
    case $REPLY in
        1 ) check=`cat ~/meyasql/$databaseName/.$tableName`
            if [ "$check" = "" ]; then
                echo -n "enter the name of column (PrimaryKey) : " ;
                inputFlag="true"
            else
                colList=($(awk -F: '{ print $1 }' .$tableName))
                echo -n "enter the name of column except ( ${colList[*]} ) : " ;
            fi

            read colName
            ;;

        2 )
            . ./tableManager
            ;;
    esac
done
