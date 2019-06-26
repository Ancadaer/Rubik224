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
void uiPrimeMove(char * file);
void uMove(char * file);
void uPrimeMove(char * file);
void diMove(char * file);
void diPrimeMove(char * file);
void dMove(char * file);
void dPrimeMove(char * file);
void movement(char* file, int start, int times, int axis, int doBoth);
void xAxisLowRotation(char* configuracion, int start, int times, int doBoth);
void xAxisHighRotation(char* configuracion, int start, int times, int doBoth);
void yAxisLowRotation(char* configuracion, int start, int times, int doBoth);
void yAxisHighRotation(char* configuracion, int start, int times, int doBoth);
void getConfiguracion(char* configuracion, char* file);
void printConfiguracion(char* configuracion, char* file);
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

mov: UIPRIME {uiPrimeMove(file);} | UI {uiMove(file);} | UPRIME {uPrimeMove(file);} | U {uMove(file);} 
	| DIPRIME {diPrimeMove(file);} | DI {diMove(file);} | DPRIME {dPrimeMove(file);} | D {dMove(file);}
	| RIPRIME | RI | RPRIME | R | BIPRIME | BI | BPRIME | B
	| LIPRIME | LI | LPRIME | L | FIPRIME | FI | FPRIME | F 
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


void uiMove(char * file) { movement(file, 6, 1, 1, 1);}

void uiPrimeMove(char * file) { movement(file, 6, 3, 1, 1);}

void uMove(char * file) { movement(file, 6, 1, 2, 0);}

void uPrimeMove(char * file) { movement(file, 6, 3, 2, 0);}

void diMove(char * file) { movement(file, 66, 3, 1, 1);}

void diPrimeMove(char * file) { movement(file, 66, 1, 1, 1);}

void dMove(char * file) { movement(file, 66, 3, 1, 0);}

void dPrimeMove(char * file) { movement(file, 66, 1, 1, 0);}

void movement(char* file, int start, int times, int axis, int doBoth) {
	char configuracion [1000];
	getConfiguracion(configuracion, file);
	switch(axis){
		case 1: xAxisLowRotation(configuracion, start, times, doBoth);
			break;
		case 2: xAxisHighRotation(configuracion, start, times, doBoth);
			break;
		case 3: yAxisLowRotation(configuracion, start, times, doBoth);
			break;
		case 4: yAxisHighRotation(configuracion, start, times, doBoth);
			break;
		case 5: zAxisLowRotation(configuracion, start, times, doBoth);
			break;
		case 6: zAxisHighRotation(configuracion, start, times, doBoth);
			break;
	}
	printConfiguracion(configuracion, file);
}

void xAxisLowRotation(char* configuracion, int start, int times, int doBoth) {
	char tmp1;
	
	for (int i = 1; i <= times; i++) {
		tmp1 = configuracion[start+37];
		configuracion[start+37] = configuracion[start+42];
		configuracion[start+42] = configuracion[start+47];
		configuracion[start+47] = configuracion[start+52];
		configuracion[start+52] = tmp1;

		tmp1 = configuracion[start+38];
		configuracion[start+38] = configuracion[start+43];
		configuracion[start+43] = configuracion[start+48];
		configuracion[start+48] = configuracion[start+53];
		configuracion[start+53] = tmp1;
	}
	
	if (doBoth)	xAxisHighRotation(configuracion, start, times, 0);
}

void xAxisHighRotation(char* configuracion, int start, int times, int doBoth) {
	char tmp1;
	
	for (int i = 1; i <= times; i++) {
		tmp1 = configuracion[start+7];
		configuracion[start+7] = configuracion[start+12];
		configuracion[start+12] = configuracion[start+17];
		configuracion[start+17] = configuracion[start+22];
		configuracion[start+22] = tmp1;

		tmp1 = configuracion[start+8];
		configuracion[start+8] = configuracion[start+13];
		configuracion[start+13] = configuracion[start+18];
		configuracion[start+18] = configuracion[start+23];
		configuracion[start+23] = tmp1;
	}

	if (doBoth)	xAxisLowRotation(configuracion, start, times, 0);
}

void yAxisLowRotation(char* configuracion, int start, int times, int doBoth) {
	char tmp1;
	
	for (int i = 1; i <= times; i++) {
		tmp1 = configuracion[start+37];
		configuracion[start+37] = configuracion[start+42];
		configuracion[start+42] = configuracion[start+47];
		configuracion[start+47] = configuracion[start+52];
		configuracion[start+52] = tmp1;

		tmp1 = configuracion[start+38];
		configuracion[start+38] = configuracion[start+43];
		configuracion[start+43] = configuracion[start+48];
		configuracion[start+48] = configuracion[start+53];
		configuracion[start+53] = tmp1;
	}
	
	if (doBoth)	yAxisHighRotation(configuracion, start, times, 0);
}

void yAxisHighRotation(char* configuracion, int start, int times, int doBoth) {
	char tmp1;
	
	for (int i = 1; i <= times; i++) {
		tmp1 = configuracion[start+7];
		configuracion[start+7] = configuracion[start+12];
		configuracion[start+12] = configuracion[start+17];
		configuracion[start+17] = configuracion[start+22];
		configuracion[start+22] = tmp1;

		tmp1 = configuracion[start+8];
		configuracion[start+8] = configuracion[start+13];
		configuracion[start+13] = configuracion[start+18];
		configuracion[start+18] = configuracion[start+23];
		configuracion[start+23] = tmp1;
	}

	if (doBoth)	yAxisLowRotation(configuracion, start, times, 0);
}

void zAxisLowRotation(char* configuracion, int start, int times, int doBoth) {
	char tmp1;
	
	for (int i = 1; i <= times; i++) {
		tmp1 = configuracion[start+37];
		configuracion[start+37] = configuracion[start+42];
		configuracion[start+42] = configuracion[start+47];
		configuracion[start+47] = configuracion[start+52];
		configuracion[start+52] = tmp1;

		tmp1 = configuracion[start+38];
		configuracion[start+38] = configuracion[start+43];
		configuracion[start+43] = configuracion[start+48];
		configuracion[start+48] = configuracion[start+53];
		configuracion[start+53] = tmp1;
	}
	
	if (doBoth)	zAxisHighRotation(configuracion, start, times, 0);
}

void zAxisHighRotation(char* configuracion, int start, int times, int doBoth) {
	char tmp1;
	
	for (int i = 1; i <= times; i++) {
		tmp1 = configuracion[start+7];
		configuracion[start+7] = configuracion[start+12];
		configuracion[start+12] = configuracion[start+17];
		configuracion[start+17] = configuracion[start+22];
		configuracion[start+22] = tmp1;

		tmp1 = configuracion[start+8];
		configuracion[start+8] = configuracion[start+13];
		configuracion[start+13] = configuracion[start+18];
		configuracion[start+18] = configuracion[start+23];
		configuracion[start+23] = tmp1;
	}

	if (doBoth)	zAxisLowRotation(configuracion, start, times, 0);
}




void getConfiguracion(char* configuracion, char* file){
	char ch; 
	FILE *my_file;
	my_file = fopen(file, "r");

	configuracion[0] = 'x';
	configuracion[1] = 'x';
	configuracion[2] = 'x';
	configuracion[3] = 'x';
	configuracion[4] = 'x';
	configuracion[5] = 'x';
	configuracion[6] = 'x';

	while ((ch = fgetc(my_file)) != EOF) append(configuracion, ch);

	fclose(my_file);
}

void printConfiguracion(char* configuracion, char* file){
	FILE *my_file;
	my_file = fopen(file, "w");

	printf("%s\n", configuracion+7);
	fprintf(my_file, "%s", configuracion+7);

	fclose(my_file);
}

void append(char* s, char c){
        int len = strlen(s);
        s[len] = c;
        s[len+1] = '\0';
}
