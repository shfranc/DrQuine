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

function main {

	printf "Test Colleen:\t"; test_colleen; print_result $result;
	printf "Test Grace:\t"; test_grace; print_result $result;
}

main "$@"
