%{
	/* Librerias C */
	#include <ctype.h>
	#include <stdio.h>
	
	extern int yylex();
	void yyerror(char *msg);
%}
						/*Tokens de la gramática*/
%token false
%token true
%token or
%token and
%token not


%%
lines	:	lines bexpr '\n'	
			{ 
				if($2 == 1){printf("true(1)\n", $2) ;} 
				else
				{ printf("false(0)\n", $2) ;}
			}
		|	lines '\n'
		|	/* empty */
		;

bexpr	:	bexpr or bterm		{ $$ = $1 || $3 }
		|	bterm
			;

bterm	:	bterm and bfactor	{ $$ = $1 && $3 }
		|	bfactor
		;

bfactor	:	not bfactor { $$ = !$2 }
		|	'(' bexpr ')' { $$ = $2 }
		|	false
		| 	true
		;
%%

#include "lex.yy.c"

void yyerror(char *msg){			/*Manejo de Errores de sintaxis*/
	printf("Error de Sintaxis");
	exit(0);
}

int main(){							/* Método main */
	yyparse();
	return 0;
}