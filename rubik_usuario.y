%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

void yyerror (char const *);
void yyerrorCmd (char *);
int yylex();
void create224Configuration (char *);
void scrambleN(char * , int);
int exitsFile(char *);
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
;
lista_cmds : cmd lista_cmds
			| cmd
;

cmd : CREATE MYFILE {if (!exitsFile($2)) create224Configuration($2); else yyerrorCmd("Can't create file, it already exists.\n");}
		|RESET MYFILE {if (exitsFile($2)) create224Configuration($2); else yyerrorCmd("Can't reset file, it doesn't exist.\n");}
		|SCRAMBLE TIMES MYFILE
		|SOLVED MYFILE
		|SOLVE MYFILE
		|MOVE MYFILE {file = strdup($2);} lista_movs
		|EXITR {exitRubik();}
		|error {yyerrorCmd("Wrong command.");}
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




void scrambleN(char * file, int n) {
	/*De momento declaro j para hacer algo en el for
		lo sustituiria el hacer un movimiento aleatorio una vez esten hechos
	*/
	int j = 0;
	for (int i = 0; i <= n; i++) {
		j++;

	}

}

int exitsFile(char * file) {
	if (access(file, F_OK) != -1)
		return 1;
	else
		return 0;

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
	while ((ch = fgetc(source)) != EOF)
		append(configuracion, ch);

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

	fprintf(target, "%s\n", configuracion);
}

void append(char* s, char c){
        int len = strlen(s);
        s[len] = c;
        s[len+1] = '\0';
}
