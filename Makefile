NAME		= AutoClass
	
CC			= c++
FLAGS		=  -std=c++11
RM			= rm -rf

OBJDIR		= .objFiles

FILES		= main.cpp

SRC			= $(FILES:=.cpp)
OBJ			= $(addprefix $(OBJDIR)/, $(FILES:=.o))
HEADER		= 

all: $(NAME)

$(NAME): 
	$(CC) $(FLAGS) $(FILES) -o $(NAME)

fclean: clean
	@$(RM) $(NAME)

re: fclean all

.PHONY: all clean fclean re 