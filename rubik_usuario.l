%{
#include <stdlib.h>
#include "rubik_usuario.tab.h"
%}

file [a-zA-Z0-9]+\.txt
entero [0-9]+

%%
create        {return CREATE;}
reset         {return RESET;}
move			   	{return MOVE;}
scramble			{return SCRAMBLE;}
exit          {return EXITR;}

ui'           {return UIPRIME;}
ui            {return UI;}
u'            {return UPRIME;}
u             {return U;}
ri'           {return RIPRIME;}
ri            {return RI;}
r'            {return RPRIME;}
r             {return R;}
bi'           {return BIPRIME;}
bi            {return BI;}
b'            {return BPRIME;}
b             {return B;}
li'           {return LIPRIME;}
li            {return LI;}
l'            {return LPRIME;}
l             {return L;}
fi'           {return FIPRIME;}
fi            {return FI;}
f'            {return FPRIME;}
f             {return F;}
di'           {return DIPRIME;}
di            {return DI;}
d'            {return DPRIME;}
d             {return D;}
permutacionT  {return TPERM;}

{entero}      {yylval.valInt = atoi(yytext); return TIMES;}
{file}        {yylval.valString = yytext; return MYFILE;}

[" "|\t|\n]*

%%
