%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void yyerror (char const *);
void yyerrorCmd (char *);
int yylex();
void create224Configuration (char *);
void exitRubik();
void uiMove(char * file);
void append(char* s, char c);
char * file;
%}
%union{
	char * valString;
	int valInt;
}
%error-verbose
%token <valString> MOVE EXITR SCRAMBLE SOLVED SOLVE RESET CREATE
%token <valString> UIPRIME UI UPRIME U RIPRIME RI RPRIME R BIPRIME BI BPRIME B 
%token <valString> LIPRIME LI LPRIME L FIPRIME FI FPRIME F DIPRIME DI DPRIME D
%token <valString> MYFILE
%token <valInt> TIMES
%type <valString>  lista_cmds cmd lista_movs mov
%start S

%%

S:  lista_cmds
	| error {yyerrorCmd("There are no commands.");}	
;
lista_cmds : cmd lista_cmds
			| cmd
;

cmd : CREATE MYFILE {create224Configuration($2);}
		|RESET MYFILE 
		|SCRAMBLE TIMES MYFILE
		|SOLVED MYFILE
		|SOLVE MYFILE
		|MOVE MYFILE {file = strdup($2);} lista_movs 
		|EXITR {exitRubik();}
		|error {yyerrorCmd("There are no commands.");}
;

lista_movs : mov lista_movs
			| mov
;

mov: UIPRIME | UI {uiMove(file);} | UPRIME | U | RIPRIME | RI | RPRIME | R | BIPRIME | BI | BPRIME | B 
	| LIPRIME | LI | LPRIME | L | FIPRIME | FI | FPRIME | F | DIPRIME | DI | DPRIME | D
;

%%

int main() {
	yyparse();
	return 0;
}
void yyerror (char const *message) { fprintf (stderr, "%s\n", message);}

void yyerrorCmd (char * msg) {
	yyerror(msg);
}

void create224Configuration (char * file) {
	FILE *source;
	FILE *target;
	char ch;
	source = fopen("./resources/conf.txt", "r");
	target = fopen(file, "w");

	while((ch = fgetc(source)) != EOF)
      fputc(ch, target);
 
   fclose(source);
   fclose(target);
}


void exitRubik(){
	printf("Exiting Rubik224\n");
	exit(0);
}

void uiMove(char * file) {
	char configuracion [1000];
	FILE *source;
	char ch, tmp1;
	source = fopen("./resources/conf.txt", "r");
	while ((ch = fgetc(source)) != EOF) append(configuracion, ch);

	tmp1 = configuracion[6];
	configuracion[6] = configuracion[11];
	configuracion[11] = configuracion[16];
	configuracion[16] = configuracion[21];
	configuracion[21] = tmp1;

	tmp1 = configuracion[7];
	configuracion[7] = configuracion[12];
	configuracion[12] = configuracion[17];
	configuracion[17] = configuracion[22];
	configuracion[22] = tmp1;

	tmp1 = configuracion[36];
	configuracion[36] = configuracion[41];
	configuracion[41] = configuracion[46];
	configuracion[46] = configuracion[51];
	configuracion[51] = tmp1;

	tmp1 = configuracion[37];
	configuracion[37] = configuracion[42];
	configuracion[42] = configuracion[47];
	configuracion[47] = configuracion[52];
	configuracion[52] = tmp1;


	FILE *target;
	target = fopen(file, "w");

	fprintf(target, "%s", configuracion);
}

void append(char* s, char c){
        int len = strlen(s);
        s[len] = c;
        s[len+1] = '\0';
}