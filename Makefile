FUENTE = rubik_usuario
PRUEBA = movimientos.txt

all: compile run clean

compile:
	flex $(FUENTE).l
	bison -o $(FUENTE).tab.c $(FUENTE).y -yd
	gcc -o $(FUENTE) lex.yy.c $(FUENTE).tab.c -lfl -ly

run:
	./$(FUENTE) < $(PRUEBA)

clean:
	rm $(FUENTE) lex.yy.c $(FUENTE).tab.c $(FUENTE).tab.h
