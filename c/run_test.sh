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
	./Colleen > tmp ; diff Colleen.c tmp > /dev/null 2>&1
	result=$?
	rm tmp
}

function test_grace {
	./Grace ; diff Grace.c Grace_kid.c > /dev/null 2>&1
	result=$?
}

function test_sully {
	./Sully ;
	nb=$(ls -al | grep Sully | wc -l)
	if [ $nb -ne 14 ] ; then
		result=1;
	else
		result=0;
	fi
}

function diff_grace {
	printf "%s\n" "diff Grace.c Grace_kid.c"; diff Grace.c Grace_kid.c
}

function diff_sully {
	printf "%s\n" "diff Sully.c Sully_0.c"; diff Sully.c Sully_0.c
	printf "%s\n" "diff Sully_3.c Sully_2.c"; diff Sully_3.c Sully_2.c
}

function main {
	printf "Test Colleen:\t"; test_colleen; print_result $result;
	printf "Test Grace:\t"; test_grace; print_result $result;
	if [ $result -ne 0 ] ; then 
		diff_grace;
	fi
	printf "Test Sully:\t"; test_sully; print_result $result;
	diff_sully;
	exit 0;
}

main "$@"
