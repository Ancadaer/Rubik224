FUENTE = rubik_usuario
PRUEBA = movimientos.txt
PRUEBA1 = prueba1.txt
PRUEBA2 = prueba2.txt
PRUEBA3 = prueba3.txt

all: compile run clean
run1: compile t1 clean
run2: compile t2 clean
run3: compile t3 clean

compile:
	flex $(FUENTE).l
	bison -o $(FUENTE).tab.c $(FUENTE).y -yd
	gcc -o $(FUENTE) lex.yy.c $(FUENTE).tab.c -lfl -ly

run:
	#./$(FUENTE)
	./$(FUENTE) < $(PRUEBA1)
	./$(FUENTE) < $(PRUEBA2)
	./$(FUENTE) < $(PRUEBA3)

clean:
	rm $(FUENTE) lex.yy.c $(FUENTE).tab.c $(FUENTE).tab.h
