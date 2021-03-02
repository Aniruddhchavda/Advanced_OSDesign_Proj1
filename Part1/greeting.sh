#for Lib
IDIR =../include
CC=gcc
CFLAGS=-I$(IDIR)

#For Obj
ODIR=obj

#For Libs
LDIR =../lib
LIBS=-lm

#For Header
_DEPS=myHeader.h
DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))

#Create obj files
_OBJ = ani2.o
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))

$(ODIR)/%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

BINPATH=../bin

$(BINPATH)/HelloMake2: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS) $(LIBS)
.PHONY: clean

clean:
	rm -f $(ODIR)/*.o *~ core $(INCDIR)/*~
