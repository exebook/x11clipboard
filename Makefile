PNAME   = x11clipboard
PVER    = 0.20180620
PROG1   = x11copy
PROG2   = x11paste
PROGS   = $(PROG1) $(PROG2)
PDOCS   = AUTHORS CHANGELOG LICENSE README.md
#CC      = gcc
CC      = clang
LIBS    = -lX11
PREFIX  = /usr/local
RM      = @rm -fv
INSTALL = install

.PHONY: all clean install

all: $(PROGS)

$(PROG1):
	$(CC) src/$@.c -o $@ $(LIBS)

$(PROG2):
	$(CC) src/$@.c -o $@ $(LIBS)

clean:
	$(RM) $(PROGS)

install: $(PROGS)
	$(INSTALL) -d $(PREFIX)
	$(INSTALL) -m 0755 $(PROGS) $(PREFIX)/bin/
	$(INSTALL) -d $(PREFIX)/share/doc/$(PNAME)
	$(INSTALL) -m 0644 $(PDOCS) $(PREFIX)/share/doc/$(PNAME)
