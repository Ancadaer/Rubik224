%{
	unsigned moveCount = 0; unsigned notMoveCount = 0;
%}
move [ulfrbd]"i"?"'"?

%%
Move 				printf("Realizar movimiento\n");
Command				printf("Introducir comando\n");
exit				printf("Salir\n");
scramble			printf("Deshacer\n");
solved				printf("Mostrar resuelto\n");
solve 				printf("Resolver\n");
{move}(" "{move})*	moveCount++; ECHO; printf("\n");
[" "|\t|\n]* 

%%
int main()
{
	yylex();
}
