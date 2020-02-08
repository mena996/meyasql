#!/usr/bin/bash


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

# if [ -f "~/meyasql/$databaseName/$tableName" ]; then
if [ -f "~/meyasql/$databaseName/$tableName" ]; then
echo "That table already exists .. !!!"
. ./tableManager.sh
else
touch ~/meyasql/$databaseName/$tableName
touch ~/meyasql/$databaseName/.$tableName
inputFlag="false"
. ./createColoumn.sh 
echo "The table created Successfully ... !!!"
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
#break 1
. ./main
esac
done
else 
echo "data base doesnot exist"
fi
