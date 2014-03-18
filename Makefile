all: 
	clang x11copy.c -o x11copy -lX11
	clang x11paste.c -o x11paste -lX11
