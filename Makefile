SHELL=cmd.exe
TARGET = AstroCommander.exe

SRC_DIR = src
OBJ_DIR = obj
INC_DIR = inc
LIB_DIR = lib

vpath %.asm SRC_DIR
vpath %.inc INC_DIR
vpath %.obj OBJ_DIR

CFLAGS = /c /Cp /I \src\ConGameLib\inc /I $(INC_DIR)
LDFLAGS = /ENTRY:main /SUBSYSTEM:CONSOLE
LDLIBS = /LIBPATH:\src\ConGameLib\lib

CC=\masm32\bin\ml64.exe
LNK=\masm32\bin\link.exe

SOURCES = $(wildcard $(SRC_DIR)/*.asm)
OBJECTS = $(subst $(SRC_DIR)/,$(OBJ_DIR)/,$(SOURCES:.asm=.obj))

$(OBJ_DIR)/%.obj: $(SRC_DIR)/%.asm
	$(CC) $(CFLAGS) /Fo $@ $<

all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(LNK) $(LDFLAGS) /OUT:$@ $(LDLIBS) $^

clean:
	@-del $(OBJ_DIR)\*.obj