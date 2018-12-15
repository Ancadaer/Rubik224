%{
	unsigned moveCount = 0; unsigned notMoveCount = 0;
%}
move [ulfrbd]"i"?"'"?" "
eol \n

%%
Move {moveCount+=10;;}
{move} {moveCount++;}
. {notMoveCount++;}
{eol} {notMoveCount++;}

%%
int main()
{
	yylex();
	printf("%d movimientos, %d no movimientos.\n", moveCount, notMoveCount);
}
