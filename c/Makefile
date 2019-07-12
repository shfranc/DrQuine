COLLEEN = Colleen
GRACE = Grace
SULLY = Sully
FLAGS = -Wall -Wextra -Werror
CC = gcc

PATH_OBJS = objs

SRCS = Colleen.c Grace.c Sully.c
OBJS = $(SRCS:%.c=$(PATH_OBJS)/%.o)

GREEN = \033[01;32m
YELLOW = \033[01;33m
BLUE = \033[01;34m
RESET = \033[00m

all: $(COLLEEN) $(GRACE) $(SULLY)

$(COLLEEN): $(OBJS)
	@$(CC) $(FLAGS) -o $@ Colleen.c
	@echo "$(GREEN)$@:$(RESET) OK"

$(GRACE): $(OBJS)
	@$(CC) $(FLAGS) -o $@ Grace.c
	@echo "$(GREEN)$@:$(RESET) OK"

$(SULLY): $(OBJS)
	@$(CC) $(FLAGS) -o $@ Sully.c
	@echo "$(GREEN)$@:$(RESET) OK"

$(PATH_OBJS)/%.o: %.c
	@mkdir -p $(PATH_OBJS)
	@$(CC) $(FLAGS) -c $< -o $@
	@echo "$(YELLOW)compil:$(RESET) $@"

test: $(COLLEEN) $(GRACE) $(SULLY)
	@sh run_test.sh

clean:
	@rm -rf $(OBJS) Grace_kid.c Sully_*
	@echo "$(BLUE)clean:$(RESET) $(PATH_OBJS)"

fclean: clean
	@rm -rf $(COLLEEN) $(GRACE) $(SULLY)
	@echo "$(BLUE)clean:$(RESET) $(COLLEEN) $(GRACE) $(SULLY)"

re: fclean all
