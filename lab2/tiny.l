/* Scanner para a linguagem Tiny. */

%{
#include <stdio.h>
#include <ctype.h>
%}

letra  [a-zA-Z]
digito [0-9]
palavra ({letra}+)
numero  ({digito}+)
abreComentario "{"
fechaComentario "}"

%%
"if"			{ printf("%d: %s -> IF\n", yylineno, yytext); }
"then"		{ printf("%d: %s -> THEN\n", yylineno, yytext); }
"else"		{ printf("%d: %s -> ELSE\n", yylineno, yytext); }
"end"		{ printf("%d: %s -> END\n", yylineno, yytext); }
"repeat"		{ printf("%d: %s -> REPEAT\n", yylineno, yytext); }
"until"		{ printf("%d: %s -> UNTIL\n", yylineno, yytext); }
"read"		{ printf("%d: %s -> READ\n", yylineno, yytext); }
"write"		{ printf("%d: %s -> WRITE\n", yylineno, yytext); }
{numero}		{ printf("%d: %s -> NUM\n", yylineno, yytext); }
{palavra}		{ printf("%d: %s -> ID\n", yylineno, yytext); }
"+"			{ printf("%d: %s -> PLUS\n", yylineno, yytext); }
"-"			{ printf("%d: %s -> MINUS\n", yylineno, yytext); }
"*"			{ printf("%d: %s -> TIMES\n", yylineno, yytext); }	
"/"			{ printf("%d: %s -> OVER\n", yylineno, yytext); }	
"="			{ printf("%d: %s -> EQ\n", yylineno, yytext); }	
"<"			{ printf("%d: %s -> LT\n", yylineno, yytext); }	
"("			{ printf("%d: %s -> LPAREN\n", yylineno, yytext); }	
")"			{ printf("%d: %s -> RPAREN\n", yylineno, yytext); }	
";"			{ printf("%d: %s -> SEMI\n", yylineno, yytext); }	
":="			{ printf("%d: %s -> ASSIGN\n", yylineno, yytext); }	
\n			{ yylineno++; }
[ \t]		{}
{abreComentario}[^}]*{fechaComentario} {
	int i;
	for(i=0; i<yyleng; i++){
		if(yytext[i] == '\n'){
			yylineno++;
		}
	}
} 

	/*
"{"			{ 
				char str[1]; 
				str[0] = 'z'; 
				while(str[0] != '}') { 
					scanf("%s", str); 
					printf("%s\n", str); 
				} 
			}
*/
.			{ printf("%d: %s -> UNKNOWN\n", yylineno, yytext); }
%%

int main() { yylex(); return 0; }

/* Definindo esta funcao nao precisa compilar com -lfl */
int yywrap() { return 1; }
