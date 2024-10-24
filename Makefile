NAME        = AutoClass

CC          = c++
FLAGS       = -std=c++17
RM          = rm -rf

OBJDIR      = .objFiles

FILES       = main.cpp

SRC         = $(FILES:=.cpp)
OBJ         = $(addprefix $(OBJDIR)/, $(FILES:=.o))
HEADER      =

SCRIPT      = autoclass.sh  # Name of your .sh script

all: $(NAME) 

Alias : $(NAME) run-script

$(NAME):
	$(CC) $(FLAGS) $(FILES) -o $(NAME)

run-script:
	@./$(SCRIPT)  # Execute the shell script

fclean:
	@$(RM) $(NAME)

re: fclean all

.PHONY: all clean fclean re run-script Alias
