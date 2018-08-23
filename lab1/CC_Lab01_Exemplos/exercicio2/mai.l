%{/* Reconhece numeros naturais arbitrarios. */
#include <stdio.h>
#include <ctype.h>
%}
maiuscula  [A-Z]
%%
{maiuscula}    { printf("%c", tolower(yytext[0])); }
.   			{ printf("%s", yytext); }
%%
int main() { yylex(); return 0; }
/* Definindo esta funcao nao precisa compilar com -lfl */
int yywrap() { return 1; }
