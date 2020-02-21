#!/bin/bash

# Automates the testing of all possible input for parallelograms.sh

INPUT=""
YES="\ny\n"
for inp in {2..20..1}; do
	INPUT=$INPUT$inp$YES
done
INPUT=$INPUT"20\nn\n"
printf $INPUT | ./parallelograms.sh > myOutput
echo "My script done - saved to 'myOutput'"
printf $INPUT | parallelograms > publicOutput
echo "Public script done - saved to 'publicOutput'"
echo -e "\nDifferences in Results\n----------------------\n"
diff myOutput publicOutput
