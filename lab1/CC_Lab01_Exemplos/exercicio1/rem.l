%{/* Reconhece numeros naturais arbitrarios. */
#include <stdio.h>
%}
hashtag  [#]
comentario  ({hashtag}.*)
%%
{comentario}    {  }
.+   { printf("%s\n", yytext); }
%%
int main() { yylex(); return 0; }
/* Definindo esta funcao nao precisa compilar com -lfl */
int yywrap() { return 1; }
