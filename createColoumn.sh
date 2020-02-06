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
                colList=($(awk -F: '{ print $1 }' ~/meyasql/$databaseName/.$tableName))
                echo -n "enter the name of column except ( ${colList[*]} ) : " ;
                inputFlag="true"
            fi
            read colName
            
            check=`awk -F: '{ print $1 }' ~/meyasql/$databaseName/.$tableName | grep "^$colName$"`

            if [ "$check" = "" ]; then

                select choice in "string" "number" ;
                do
                    case $REPLY in
                        1 ) dataType="string"
                            break;;
                        2 ) dataType="number"
                            break;;
                    esac
                done

                awk -F: ' { print $0 } END{ print "'$colName:$dataType'" }' ~/meyasql/$databaseName/.$tableName > temp.tmp && mv temp.tmp ~/meyasql/$databaseName/.$tableName
            else
                echo "this column already exists";
            fi
                . ./createColoumn.sh
            ;;

        2 )
            . ./tableManager
            ;;
    esac
done
