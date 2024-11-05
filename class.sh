#!/bin/bash

# Check if at least one argument is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 [file1] [file2]"
    exit 1
fi

# Check and create directories if they do not exist
[ ! -d "src" ] && mkdir "src"
[ ! -d "inc" ] && mkdir "inc"

# Create Makefile if it does not exist


# Process only the first argument
name="$1"
nameCPP="src/${name}.cpp"
nameHPP="inc/${name}.hpp"
Define=$(echo "${name}_HPP" | tr '[:lower:]' '[:upper:]')

# Skip if files already exist
[ -f "$nameCPP" ] && exit 0
[ -f "$nameHPP" ] && exit 0

# Create .hpp file
cat <<EOL > "$nameHPP"
#ifndef $Define
# define $Define

# include <iostream>

class $name
{
    private :

    public :
        $name();
        ~$name();
        // $name(const $name &other);
        // $name& operator=(const $name &other);
};

// std::ostream& operator<<(std::ostream& os, const $name& other);

#endif
EOL

# Create .cpp file
cat <<EOL > "$nameCPP"
#include "$name.hpp"

$name::$name()
{
    // std::cout << "Default constructor called" << std::endl;
}

$name::~$name()
{
    // std::cout << "Destructor called" << std::endl;
}

$name::$name(const $name& other)
{
    // std::cout << "Recopy constructor called" << std::endl;
}

$name& $name::operator=(const $name &other)
{
    // std::cout << "Assignment operator called" << std::endl;
}
EOL

if [ ! -f "Makefile" ]; then
    cat <<EOL > Makefile
NAME		= Exec

CC			= c++
FLAGS		= -Wall -Wextra -Werror -std=c++98
RM			= rm -rf

OBJDIR		= .objFiles
SRCDIR		= src
INCDIR		= inc

FILES		= main $name
INCFILE		= $name

SRC			= \$(addprefix \$(SRCDIR)/, \$(FILES:=.cpp))
OBJ			= \$(addprefix \$(OBJDIR)/, \$(FILES:=.o))
HEADER		= \$(addprefix \$(INCDIR)/, \$(INCFILE:=.hpp))

all: \$(NAME)

\$(NAME): \$(OBJ) \$(HEADER)
    \$(CC) \$(OBJ) -o \$(NAME)

\$(OBJDIR)/%.o: \$(SRCDIR)/%.cpp \$(HEADER) Makefile
    mkdir -p \$(dir \$@)
    \$(CC) \$(FLAGS) -I\$(INCDIR) -c \$< -o \$@

clean:
    \$(RM) \$(OBJDIR) \$(OBJ)

fclean: clean
    \$(RM) \$(NAME)

re: fclean all

.PHONY: all clean fclean re
EOL
fi