%{
	unsigned moveCount = 0; unsigned notMoveCount = 0;
%}
move [ulfrbd]"i"?"'"?
notMove [^ulfrbd]
%%
{move} {moveCount++;}
{notMove} {notMoveCount++;}

%%
void main()
{
	yylex();
	printf("%d movimientos\n", moveCount);
}
