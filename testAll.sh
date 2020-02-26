#!/bin/bash

# Automates the testing of all possible input for parallelograms.sh

# variables used within script
# INPUT used to handle all user input prompts to script
# YES used to build the repetitive portions of INPUT
INPUT=""
YES="\ny\n"

# loop for generating the repetitive portions of the INPUT
# 'number (2..19) newline y(es) newline' repeatedly added onto INPUT
for inp in {2..20..1}; do
	INPUT=$INPUT$inp$YES
done
# final case '20 newline n(o) newline' will reject a replay
INPUT=$INPUT"20\nn\n"

# pipes the content of INPUT to both student script and public driver, using te
# to display results to user as well as write to an output file
printf $INPUT | ./parallelograms.sh | tee myOutput
echo "Student script done - saved to 'myOutput'"

# Notifies user that testing of the student script has finished and been written
# to an output file, then prompts user to continue to public driver
echo -e "\nNow press Enter to see how fast the public driver executes"
read

# Similar logic to student script - INPUT string piped into public driver and
# output sent to both stdout and output file using tee
printf $INPUT | parallelograms | tee publicOutput
echo "Public script done  - saved to 'publicOutput'"

# emptiness of diff command used to determine the need for vimdiff
if [ "`diff myOutput publicOutput`" == "" ]; then
	echo -e "\nNoice! No differences from public script!"
else
	echo -e "\nPress Enter to open vimdiff to see differences"
	read
	vimdiff myOutput publicOutput
fi
