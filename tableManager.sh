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
  "string")
  echo "$fieldName:string" >>".$tableName"
  break;
  ;;
  esac
  done
done

fi
;;
"Insert")
. ./insertTable.sh
;;
"Delete")
;;
"Select")
. ./selectTable.sh
;;
"Exit")
cd $home
break 1
esac
done
else 
echo "data base doesnot exist"
fi
