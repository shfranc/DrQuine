COLLEEN = Colleen
GRACE = Grace
SULLY = Sully

PYTHON = python3

GREEN = \033[01;32m
YELLOW = \033[01;33m
BLUE = \033[01;34m
RESET = \033[00m

all: $(COLLEEN) $(GRACE) $(SULLY)

$(COLLEEN):
	@echo "$(GREEN)$@:$(RESET)"
	@$(PYTHON) Colleen.py

$(GRACE):
	@echo "$(GREEN)$@:$(RESET)"
	@$(PYTHON) Grace.py
	@ls -1 Grace*

$(SULLY):
	@echo "$(GREEN)$@:$(RESET)"
	@$(PYTHON) Sully.py
	@ls -1 Sully*

test:
	@sh run_test.sh

clean:
	@rm -rf Grace_kid.py Sully_*
	@echo "$(BLUE)clean:$(RESET) Grace_kid.py Sully_*"

fclean: clean

re: test clean fclean all
