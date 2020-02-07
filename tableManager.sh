#!/usr/bin/bash 
echo "please enter database name"
read databaseName
if [ -d ~/meyasql/$databaseName ] 
then
cd ~/meyasql/$databaseName
echo "database connected"
select operation in "List tables" "Create table"  "Insert" "Delete" "Select" "Exit"
do
case $operation in
"List tables")
if [ "$(ls -A ~/meyasql/$databaseName)" ]
then
ls ~/meyasql/$databaseName
else
echo "No tables found...!!!"
fi
;;
"Create table")
echo "Enter Table Name"
read tableName
if [ -f "~/meyasql/$databaseName/$tableName)" ] 
then
echo "That table already exists .. !!!"
else 
touch $tableName
touch ".$tableName"

while true; 
do
  echo "please enter field name (press . to exit)"
  read fieldName
  if [ $fieldName == '.' ]
  then
    break;
  fi
  echo "please enter field type (integer or string)"
  select operation in "integer" "string"
  do
  case $operation in
  "integer")
  echo "$fieldName:integer" >>".$tableName"
  break;
  ;;
  "string")recodNo
  echo "$fieldName:string" >>".$tableName"
  break;
  ;;
  esac
  done
done

fi
;;
"Insert")
. $home/insertTable.sh
;;
"Delete")
echo -n "enter the name of table to show from ( $databaseName ) :  "
read tableName
while [ ! -f ~/meyasql/$databaseName/$tableName ]
do
echo -n "table doesnot exist!!!"
echo -n "enter the name of table to show from ( $databaseName ) :  "
read tableName
done
echo -n "enter the number of record you want to delete from  ( $tableName ) :  "
read recodNo
rm -f temp
awk -F:  -v val="$recodNo" 'BEGIN{c=1}{if(val!=c) print $0; c=c+1}' $tableName  >> temp  
cat temp > $tableName
;;
"Select")
. $home/selectTable.sh
;;
"Exit")
cd $home
break 1
esac
done
else 
echo "data base doesnot exist"
fi
