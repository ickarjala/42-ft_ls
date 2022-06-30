# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ikarjala <ikarjala@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/11/05 16:57:32 by ikarjala          #+#    #+#              #
#    Updated: 2022/06/30 22:00:07 by ikarjala         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	= ft_ls
BIN		= $(ROOT)$(NAME)

CFUNC	= \
main

ROOT		= ./
SRC_DIR		= $(ROOT)src/
OBJ_DIR		= $(ROOT)
SRC			= $(addprefix $(SRC_DIR),$(addsuffix .c,$(CFUNC)))
OBJ			= $(addprefix $(OBJ_DIR),$(addsuffix .o,$(CFUNC)))
INC_DIR		= $(SRC_DIR)
CMD_INC		= $(addprefix -I ,$(INC_DIR))

CFLAGS		= -Wall -Wextra -Werror
DEBUG_FLAGS	= $(CFLAGS) -Wimplicit -Wconversion -g -fsanitize=address
CC			= clang

.PHONY: clean fclean re

##	BUILD ====
all: $(NAME)
$(NAME):
	@echo	$(BMSG_BIN)
	$(CC) -c $(CFLAGS) $(SRC) $(CMD_INC)
	$(CC) -o $(BIN) $(OBJ)
	@echo	$(BMSG_FIN)
install: re clean
debug:
	@echo	$(BMSG_DBG)
	$(CC) -o $(BIN) $(DEBUG_FLAGS) $(SRC) $(CMD_INC) \
	@echo	$(BMSG_FIN)

##	CLEANUP ====
clean:
	rm -f $(OBJ)
fclean: clean
	rm -f $(BIN)
re: fclean all

BMSG_BIN	= '$(COL_HL)' '$(NAME) :: Starting build...' '$(COL_NUL)'
BMSG_FIN	= '$(COL_CS)' '$(NAME) :: Build success!' '$(COL_NUL)'
BMSG_DBG	= '$(COL_HL)' '$(NAME) :: Starting =DEBUG= build...' '$(COL_NUL)'

COL_HL		= #\e[0;33m
COL_CS		= #\e[0;32m
COL_NUL		= #\e[0;0m

##	UTILS ====
CMD_NORME	= norminette -R CheckForbiddenSourceHeader
norme:
	$(CMD_NORME) $(SRC_DIR)*.c $(addsuffix *.h,$(INC_DIR))
