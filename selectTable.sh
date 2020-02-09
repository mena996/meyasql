#!/usr/bin/bash
echo -n "enter the name of table to show from ( $databaseName ) :  "
read tblName
cd ~/meyasql/$databaseName
check=`ls | grep "^$tblName$"`

if [ "$check" = "" ]; 
then
echo "this table is not found";

elif [ "$check" = "$tblName" ]; 
then
echo
awk -F: '{ print $0 }' $check;
echo

fi


