#
# /**************************************** MAD Engineers ****************************************
# MAD Engineers
# Copyright (c) 2017
#
# Author		: madD7
# File			: $URL$
# Description	: 
# Originator	: 
# $Id$
#*************************************************************************************************

CC = gcc
ROOTDIR_PATH= .

SRC_PATH= $(ROOTDIR_PATH)/src
INC_PATH= $(ROOTDIR_PATH)/inc
OBJ_PATH= $(ROOTDIR_PATH)/obj
CFLAGS = -Wall -I$(INC_PATH)
OUTPUT = app


ifeq ($(DEBUG),1)
	CFLAGS+=-g
endif

VPATH := $(SRC_PATH)

SRCS = app.c
OBJS = $(patsubst %.c, $(OBJ_PATH)/%.o, $(SRCS))

.PHONY: all build clean makdir

all: makdir build

makdir: 
	mkdir -p $(OBJ_PATH)

build: $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $(OUTPUT) 

# Automatic variables
# $@ - Target filename
# $< - 1st Dependency filename
$(OBJ_PATH)/%.o: $(SRC_PATH)/%.c
	$(CC) -c $(CFLAGS) $< -o $@


clean:
	rm -f $(OBJ_PATH)/*.o*
	rm -f $(OUTPUT)


