#!/bin/bash

# Automates the testing of all possible input for parallelograms.sh

INPUT=""
YES="\ny\n"
for inp in {2..20..1}; do
	INPUT=$INPUT$inp$YES
done
INPUT=$INPUT"20\nn\n"
printf $INPUT | ./parallelograms.sh > myOutput
echo "Student script done - saved to 'myOutput'"
printf $INPUT | parallelograms > publicOutput
echo "Public script done  - saved to 'publicOutput'"
if [ "`diff myOutput publicOutput`" == "" ]; then
	echo -e "\nNoice! No differences from public script!"
else
	echo -e "\nPress Enter to open vimdiff to see differences"
	read
	vimdiff myOutput publicOutput
fi
