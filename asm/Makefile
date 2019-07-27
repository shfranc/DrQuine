COLLEEN = Colleen
GRACE = Grace
SULLY = Sully
ASFLAGS = -f macho64 -g
AS = nasm
LD = ld
LDFLAGS = -macosx_version_min 10.8 -lSystem

PATH_OBJS = objs

SRCS = Colleen.s Grace.s Sully.s
OBJS = $(SRCS:%.s=$(PATH_OBJS)/%.o)

GREEN = \033[01;32m
YELLOW = \033[01;33m
BLUE = \033[01;34m
RESET = \033[00m

all: $(COLLEEN) $(GRACE) $(SULLY)

$(COLLEEN): $(OBJS)
	@$(LD) $(LDFLAGS) -o $@ $(PATH_OBJS)/$@.o
	@echo "$(GREEN)$@:$(RESET) OK"

$(GRACE): $(OBJS)
	@$(LD) $(LDFLAGS) -o $@ $(PATH_OBJS)/$@.o
	@echo "$(GREEN)$@:$(RESET) OK"

$(SULLY): $(OBJS)
	@$(LD) $(LDFLAGS) -o $@ $(PATH_OBJS)/$@.o
	@echo "$(GREEN)$@:$(RESET) OK"

$(PATH_OBJS)/%.o: ./%.s
	@mkdir -p $(PATH_OBJS)
	@$(AS) $(ASFLAGS) $< -o $@
	@echo "$(YELLOW)compil:$(RESET) $@"

test: $(COLLEEN) $(GRACE) $(SULLY)
	@sh run_test.sh

clean:
	@rm -rf $(OBJS) Grace_kid.s Sully_*
	@echo "$(BLUE)clean:$(RESET) $(PATH_OBJS)"

fclean: clean
	@rm -rf $(COLLEEN) $(GRACE) $(SULLY)
	@echo "$(BLUE)clean:$(RESET) $(COLLEEN) $(GRACE) $(SULLY)"

re: clean fclean all
