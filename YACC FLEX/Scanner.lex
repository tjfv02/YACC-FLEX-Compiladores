
Or 		or
Not		not
And		and
True	true
False	false

%%
[ \t]		; { /* Espacios en blanco */ }
{Or}	{return or;}
{Not}	{return not;}
{And}	{return and;}
{True}	{return true;}
{False}	{return false;}

[\n()]	return yytext[0];
.		printf("ERROR\n");
%%

int yywrap(void)
{
	return 0;
}
