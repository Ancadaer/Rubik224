%{
unsigned nCaras = 0, nada = 0;
%}

cara[OWBYGR]
nothing[^OWBYGR]
%%
{cara} {nCaras++;}
{nothing} {nada++;}
%%
int main () {
  yylex();
  printf("%d\n", nCaras);
}
