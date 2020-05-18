#!/bin/sh

FOLDER="$1"

Delete()
{
	echo "Deleting... '$FOLDER'"
	find "$FOLDER" -type d -empty -delete
	echo "Done."
}

[ -z "$FOLDER" ] && FOLDER="."


RES=$(find "$FOLDER" -type d -empty -print)

if [[ -z "$RES" ]]; then
	echo "No empty folder were found."
	exit
else
	echo "$RES"
fi

echo "Do you want to delete those folders? Y/N"
read ANSWER

if [[ "$ANSWER" == "y" ]]; then
	Delete
elif [[ "$ANSWER" == "Y" ]]; then
	Delete
else
	echo "Cancel."
fi