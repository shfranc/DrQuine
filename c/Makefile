NAME = Colleen
FLAGS = -Wall -Wextra -Werror
CC = gcc

PATH_OBJS = objs

SRCS = Colleen.c
OBJS = $(SRCS:%.c=$(PATH_OBJS)/%.o)

GREEN = \033[01;32m
YELLOW = \033[01;33m
BLUE = \033[01;34m
RESET = \033[00m

all: $(NAME)

$(NAME): $(OBJS)
	@$(CC) $(FLAGS) -o $@ $^
	@echo "$(GREEN)$@:$(RESET) OK"

$(PATH_OBJS)/%.o: %.c
	@mkdir -p $(PATH_OBJS)
	@$(CC) $(FLAGS) -c $< -o $@
	@echo "$(YELLOW)compil:$(RESET) $@"

test: $(NAME)
	@./$(NAME) > tmp ; diff Colleen.c tmp ; rm tmp

clean:
	@rm -rf $(OBJS)
	@echo "$(BLUE)clean:$(RESET) $(PATH_OBJS)"

fclean: clean
	@rm -rf $(NAME)
	@echo "$(BLUE)clean:$(RESET) $(NAME)"

re: fclean all
