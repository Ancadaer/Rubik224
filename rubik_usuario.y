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

void riMove(char * file);
void riPrimeMove(char * file);
void rMove(char * file);
void rPrimeMove(char * file);
void liMove(char * file);
void liPrimeMove(char * file);
void lMove(char * file);
void lPrimeMove(char * file);
void uiMove(char * file);
void uiPrimeMove(char * file);
void uMove(char * file);
void uPrimeMove(char * file);
void diMove(char * file);
void diPrimeMove(char * file);
void dMove(char * file);
void dPrimeMove(char * file);
void fiMove(char * file);
void fiPrimeMove(char * file);
void fMove(char * file);
void fPrimeMove(char * file);
void biMove(char * file);
void biPrimeMove(char * file);
void bMove(char * file);
void bPrimeMove(char * file);
void movement(char* file, int start, int times, int axis, int inRotation);

void xAxisRotation(char* configuracion, int start, int times, int inRotation);
void yAxisRotation(char* configuracion, int start, int times, int inRotation);
void zAxisRotation(char* configuracion, int start, int times, int inRotation);
void faceRotation(char* configuracion, int start);

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
	| RIPRIME {riPrimeMove(file);} | RI {riMove(file);} | RPRIME {rPrimeMove(file);} | R {rMove(file);} 
	| LIPRIME {liPrimeMove(file);} | LI {liMove(file);} | LPRIME {lPrimeMove(file);} | L {lMove(file);} 
	| FIPRIME {fiPrimeMove(file);} | FI {fiMove(file);} | FPRIME {fPrimeMove(file);} | F {fMove(file);} 
	| BIPRIME {biPrimeMove(file);} | BI {biMove(file);} | BPRIME {bPrimeMove(file);} | B {bMove(file);} 
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

/****************************************
Funciones para movimientos posibles
****************************************/

// Eje x
void riMove(char * file) { 
	movement(file, 12, 1, 1, 1);
	movement(file, 13, 1, 1, 0);
}

void riPrimeMove(char * file) { 
	movement(file, 12, 3, 1, 1);
	movement(file, 13, 3, 1, 0);
}

void rMove(char * file) { 
	movement(file, 13, 1, 1, 0);
}

void rPrimeMove(char * file) { 
	movement(file, 13, 3, 1, 0);
}

void liMove(char * file) { 
	movement(file, 11, 3, 1, 1);
	movement(file, 10, 3, 1, 0);
}

void liPrimeMove(char * file) { 
	movement(file, 11, 1, 1, 1);
	movement(file, 10, 1, 1, 0);
}

void lMove(char * file) { 
	movement(file, 10, 3, 1, 0);
}

void lPrimeMove(char * file) { 
	movement(file, 10, 1, 1, 0);
}

// Eje y
void uiMove(char * file) { 
	movement(file, 36, 1, 2, 1);
	movement(file, 6, 1, 2, 0);
}

void uiPrimeMove(char * file) { 
	movement(file, 36, 3, 2, 1);
	movement(file, 6, 3, 2, 0);
}

void uMove(char * file) { 
	movement(file, 6, 1, 2, 0);
}

void uPrimeMove(char * file) { 
	movement(file, 6, 3, 2, 0);
}

void diMove(char * file) { 
	movement(file, 66, 3, 2, 1);
	movement(file, 96, 3, 2, 0);
}

void diPrimeMove(char * file) { 
	movement(file, 66, 1, 2, 1);
	movement(file, 96, 1, 2, 0);
}

void dMove(char * file) { 
	movement(file, 66, 3, 2, 0);
}

void dPrimeMove(char * file) { 
	movement(file, 66, 1, 2, 0);
}

// Eje z
void fiMove(char * file) { 
	//movement(file, 6, 1, 3, 1);
	movement(file, 5, 1, 3, 0);
}

void fiPrimeMove(char * file) { 
	movement(file, 6, 3, 3, 1);
	movement(file, 5, 3, 3, 0);
}

void fMove(char * file) { 
	movement(file, 5, 1, 3, 0);
}

void fPrimeMove(char * file) { 
	movement(file, 5, 3, 3, 0);
}

void biMove(char * file) { 
	movement(file, 66, 3, 3, 1);
	movement(file, 96, 3, 3, 0);
}

void biPrimeMove(char * file) { 
	movement(file, 66, 1, 3, 1);
	movement(file, 96, 1, 3, 0);
}

void bMove(char * file) { 
	movement(file, 66, 3, 3, 0);
}

void bPrimeMove(char * file) { 
	movement(file, 66, 1, 3, 0);
}


void movement(char* file, int start, int times, int axis, int inRotation) {
	char configuracion [200];
	getConfiguracion(configuracion, file);
	switch(axis){
		case 1: xAxisRotation(configuracion, start, times, inRotation);
			break;
		case 2: yAxisRotation(configuracion, start, times, inRotation);
			break;
		case 3: zAxisRotation(configuracion, start, times, inRotation);
			break;
	}
	printConfiguracion(configuracion, file);
	
	for (int i = 0; i < 200; i++) configuracion[i] = '\0';
}

/****************************************
Funciones para rotaciones posibles
****************************************/

void xAxisRotation(char* configuracion, int start, int times, int inRotation) {
	char tmp1;
	
	for (int i = 1; i <= times; i++) {
		if (inRotation) {
			tmp1 = configuracion[start+7];
			configuracion[start+7] = configuracion[start+22];
			configuracion[start+22] = configuracion[start+107];
			configuracion[start+107] = configuracion[start-3];
			configuracion[start-3] = tmp1;
		}

		tmp1 = configuracion[start+37];
		configuracion[start+37] = configuracion[start+52];
		configuracion[start+52] = configuracion[start+77];
		configuracion[start+77] = configuracion[start+27];
		configuracion[start+27] = tmp1;

		tmp1 = configuracion[start+67];
		configuracion[start+67] = configuracion[start+82];
		configuracion[start+82] = configuracion[start+47];
		configuracion[start+47] = configuracion[start+57];
		configuracion[start+57] = tmp1;

		if (inRotation) {
			tmp1 = configuracion[start+97];
			configuracion[start+97] = configuracion[start+112];
			configuracion[start+112] = configuracion[start+17];
			configuracion[start+17] = configuracion[start+87];
			configuracion[start+87] = tmp1;
		}

		if (!inRotation) {
			if (start == 13) faceRotation(configuracion, 23);
			else faceRotation(configuracion, 13);
		}
	}
}

void yAxisRotation(char* configuracion, int start, int times, int inRotation) {
	char tmp1;
	
	for (int i = 1; i <= times; i++) {
		if (inRotation) {
			tmp1 = configuracion[start+6];
			configuracion[start+6] = configuracion[start+11];
			configuracion[start+11] = configuracion[start+16];
			configuracion[start+16] = configuracion[start+21];
			configuracion[start+21] = tmp1;
		}

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

		if (inRotation) {
			tmp1 = configuracion[start+9];
			configuracion[start+9] = configuracion[start+14];
			configuracion[start+14] = configuracion[start+19];
			configuracion[start+19] = configuracion[start+24];
			configuracion[start+24] = tmp1;
		}

		if (!inRotation) {
			if (start == 6) faceRotation(configuracion, 8);
			else faceRotation(configuracion, 33);
		}
	}
}

void zAxisRotation(char* configuracion, int start, int times, int inRotation) {
	char tmp1;
	
	for (int i = 1; i <= times; i++) {
		if (inRotation) {
			tmp1 = configuracion[start+7];
			configuracion[start+7] = configuracion[start+27];
			configuracion[start+27] = configuracion[start+107];
			configuracion[start+107] = configuracion[start+95];
			configuracion[start+95] = tmp1;
		}

		tmp1 = configuracion[start+37];
		configuracion[start+37] = configuracion[start+28];
		configuracion[start+28] = configuracion[start+77];
		configuracion[start+77] = configuracion[start+94];
		configuracion[start+94] = tmp1;

		tmp1 = configuracion[start+67];
		configuracion[start+67] = configuracion[start+29];
		configuracion[start+29] = configuracion[start+47];
		configuracion[start+47] = configuracion[start+93];
		configuracion[start+93] = tmp1;

		if (inRotation) {
			tmp1 = configuracion[start+97];
			configuracion[start+97] = configuracion[start+30];
			configuracion[start+30] = configuracion[start+17];
			configuracion[start+17] = configuracion[start+92];
			configuracion[start+92] = tmp1;
		}

		//printf("\n\n%c %c %c %c\n\n", configuracion[start+37],configuracion[start+28],configuracion[start+77],configuracion[start+33]);

		/*if (!inRotation) {
			if (start == 5) faceRotation(configuracion, 13);
			else faceRotation(configuracion, 23);
		}*/
	}
}

void faceRotation(char* configuracion, int start) {
	char tmp1;
	
	tmp1 = configuracion[start];
	configuracion[start] = configuracion[start+59];
	configuracion[start+59] = configuracion[start+91];
	configuracion[start+91] = configuracion[start+32];
	configuracion[start+32] = tmp1;

	tmp1 = configuracion[start+1];
	configuracion[start+1] = configuracion[start+29];
	configuracion[start+29] = configuracion[start+90];
	configuracion[start+90] = configuracion[start+62];
	configuracion[start+62] = tmp1;

	tmp1 = configuracion[start+30];
	configuracion[start+30] = configuracion[start+60];
	configuracion[start+60] = configuracion[start+61];
	configuracion[start+61] = configuracion[start+31];
	configuracion[start+31] = tmp1;
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

	printf("%s\n\n", configuracion+7);
	fprintf(my_file, "%s", configuracion+7);

	fclose(my_file);
}

void append(char* s, char c){
        int len = strlen(s);
        s[len] = c;
        s[len+1] = '\0';
}
