%{
#include <stdio.h>
#include <stdlib.h>

void yyerror (char const *);
%}
%union{
	char * valString;
}
%error-verbose
%token MOVE COMMAND EXIT SCRAMBLE SOLVED SOLVE MOVEMENT
%type <valString> lista_movimientos movimientos comando accion
%start S

%%

S : accion {printf("Tranquilo!!!\n");} 
	;
accion : comando {}
	| movimientos {}
	| EXIT {}
	;

comando : COMMAND SCRAMBLE {}
	| COMMAND SOLVED {}
	| COMMAND SOLVE {}
	;

movimientos : MOVE lista_movimientos {}
	;
lista_movimientos : lista_movimientos MOVEMENT {}
	| MOVEMENT {}
	;

%%

int main() {
	yyparse();
	return 0;
}
void yyerror (char const *message) { fprintf (stderr, "%s\n", message);}


