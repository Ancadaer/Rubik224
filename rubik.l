%{
#include <stdlib.h>
#include "temperatura.tab.h"
%}
move [ulfrbd]"i"?"'"?

%%
Move				{return MOVE;}
Command				{return COMMAND;}
exit				{return EXIT;}
scramble			{return SCRAMBLE;}
solved				{return SOLVED;}
solve 				{return SOLVE;}
{move}(" "{move})*	{yylval->strval=strdup(yytext); return(MOVEMENT	);}
[" "|\t|\n]* 

%%