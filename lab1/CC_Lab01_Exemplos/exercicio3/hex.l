%{/* Reconhece numeros naturais arbitrarios. */
#include <stdio.h>
#include <ctype.h>
%}
identificador 0["x" | "X"]
sequencia ([0-9]|[a-fA-F]){1,6}
numero  ({identificador}{sequencia})
%%
{numero}   	{ printf("%d", (int)strtol(yytext, NULL, 0)); }
.   			{ printf("%s", yytext); }
%%
int main() { yylex(); return 0; }
/* Definindo esta funcao nao precisa compilar com -lfl */
int yywrap() { return 1; }
