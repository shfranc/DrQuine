CYAN="\033[0;36m"
GREEN="\033[1;32m"
RED="\033[1;31m"
RESET="\033[00m"

function print_result {
	if [ $1 -eq 0 ] ;  then
		printf "$GREEN%s$RESET\n" "OK";
	else
		printf "$RED%s$RESET\n" "KO";
	fi
}

function test_colleen {
	python3 Colleen.py > tmp ; diff Colleen.py tmp > /dev/null 2>&1
	result=$?
	rm tmp
}

function test_grace {
	python3 Grace.py ; diff Grace.py Grace_kid.py > /dev/null 2>&1
	result=$?
}

function test_sully {
	python3 Sully.py ;
	nb=$(ls -al | grep Sully | wc -l)
	if [ $nb -ne 14 ] ; then
		result=1;
	else
		result=0;
	fi
}

function diff_sully {
	printf "%s\n" "diff Sully.c Sully_0.c"; diff Sully.c Sully_0.c
	printf "%s\n" "diff Sully_3.c Sully_2.c"; diff Sully_3.c Sully_2.c
	exit 0;
}

function main {
	printf "Test Colleen:\t"; test_colleen; print_result $result;
	printf "Test Grace:\t"; test_grace; print_result $result;
	printf "Test Sully:\t"; test_sully; print_result $result;
	diff_sully;
}

main "$@"