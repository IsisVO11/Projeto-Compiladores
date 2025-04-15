CC=gcc
CFLAGS=-Wall
LDFLAGS=-lm

all: calculadora

calculadora: lex.yy.c parser.tab.c
	$(CC) -o $@ $^ $(LDFLAGS)

lex.yy.c: scanner.l parser.tab.h
	flex scanner.l

parser.tab.c parser.tab.h: parser.y
	bison -d parser.y

clean:
	rm -f calculadora lex.yy.c parser.tab.c parser.tab.h