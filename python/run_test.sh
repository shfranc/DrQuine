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
	rm Grace_kid.py
}

function test_sully {
	python3 Sully.py
	nb=$(ls -al | grep Sully | wc -l)
	if [ $nb -ne 7 ] ; then
		result=1;
	else
		result=0;
	fi
}

function diff_sully {
	printf "%s\n" "diff Sully.py Sully_0.py"; diff Sully.py Sully_0.py
	printf "%s\n" "diff Sully_3.py Sully_2.py"; diff Sully_3.py Sully_2.py
}

function main {
	printf "Test Colleen:\t"; test_colleen; print_result $result;
	printf "Test Grace:\t"; test_grace; print_result $result;
	printf "Test Sully:\t"; test_sully; print_result $result;
	diff_sully;
}

main "$@"
