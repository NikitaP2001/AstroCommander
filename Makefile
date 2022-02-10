SHELL=cmd.exe
TARGET = AstroCom.exe

SRC_DIR = src
RES_DIR = res
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
RC=\masm32\bin\rc.exe

SOURCES = $(wildcard $(SRC_DIR)/*.asm)
RESOURCES = $(wildcard $(RES_DIR)/*.rc)
OBJECTS = $(subst $(SRC_DIR)/,$(OBJ_DIR)/,$(SOURCES:.asm=.obj))
OBJECTS += $(subst $(RES_DIR)/,$(OBJ_DIR)/,$(RESOURCES:.rc=.res))

$(OBJ_DIR)/%.obj: $(SRC_DIR)/%.asm
	$(CC) $(CFLAGS) /Fo $@ $<
	
$(OBJ_DIR)/%.res: $(RES_DIR)/%.rc
	$(RC) /fo $@ $<

all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(LNK) $(LDFLAGS) /OUT:$@ $(LDLIBS) $^

clean:
	@-del $(OBJ_DIR)\*.obj $(OBJ_DIR)\*.res