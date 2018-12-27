%{
#include <stdlib.h>
#include "rubik.tab.h"
%}
movement [ulfrbd]"i"?"'"?

%%
Move				{return MOVE;}
Command				{return COMMAND;}
exit				{return EXIT;}
scramble			{return SCRAMBLE;}
solved				{return SOLVED;}
solve 				{return SOLVE;}
{movement}			{return MOVEMENT;}
[" "|\t|\n]* 

%%