/* 
	Scanner para a linguagem C-Minus 
	Autor: Vinícius Berger
*/

%{
#include <stdio.h>
#include <ctype.h>
%}

%option yylineno
%x comentarioMultilinha
letra  [a-zA-Z]
digito [0-9]
identificador ({letra}+)|({letra}{digito}*)
numero  ({digito}+)
comentarioSimples "//".*
string "\"".*"\""

%%

"/*"           			{ BEGIN(comentarioMultilinha); }
<comentarioMultilinha>"*/"	{ BEGIN(INITIAL); }
<comentarioMultilinha>.|\n	{ }

{comentarioSimples}			{ }

"else"			{ printf("%d: %s -> ELSE\n", yylineno, yytext); }
"if"				{ printf("%d: %s -> IF\n", yylineno, yytext); }
"input"			{ printf("%d: %s -> INPUT\n", yylineno, yytext); }
"int"			{ printf("%d: %s -> INT\n", yylineno, yytext); }
"output"			{ printf("%d: %s -> OUTPUT\n", yylineno, yytext); }
"return"			{ printf("%d: %s -> RETURN\n", yylineno, yytext); }
"void"			{ printf("%d: %s -> VOID\n", yylineno, yytext); }
"while"			{ printf("%d: %s -> WHILE\n", yylineno, yytext); }
"write"			{ printf("%d: %s -> WRITE\n", yylineno, yytext); }

"+"				{ printf("%d: %s -> PLUS\n", yylineno, yytext); }
"-"				{ printf("%d: %s -> MINUS\n", yylineno, yytext); }
"*"				{ printf("%d: %s -> TIMES\n", yylineno, yytext); }	
"/"				{ printf("%d: %s -> OVER\n", yylineno, yytext); }	
"<"				{ printf("%d: %s -> LT\n", yylineno, yytext); }	
"<="				{ printf("%d: %s -> LE\n", yylineno, yytext); }	
">"				{ printf("%d: %s -> GT\n", yylineno, yytext); }	
">="				{ printf("%d: %s -> GE\n", yylineno, yytext); }	
"=="				{ printf("%d: %s -> EQ\n", yylineno, yytext); }	
"!="				{ printf("%d: %s -> NEQ\n", yylineno, yytext); }	
"="				{ printf("%d: %s -> ASSIGN\n", yylineno, yytext); }

";"				{ printf("%d: %s -> SEMI\n", yylineno, yytext); }
","				{ printf("%d: %s -> COMMA\n", yylineno, yytext); }		
"("				{ printf("%d: %s -> LPAREN\n", yylineno, yytext); }	
")"				{ printf("%d: %s -> RPAREN\n", yylineno, yytext); }	
"["				{ printf("%d: %s -> LBRACK\n", yylineno, yytext); }	
"]"				{ printf("%d: %s -> RBRACK\n", yylineno, yytext); }	
"{"				{ printf("%d: %s -> LBRACE\n", yylineno, yytext); }	
"}"				{ printf("%d: %s -> RBRACE\n", yylineno, yytext); }	

{string}			{ printf("%d: %s -> STRING\n", yylineno, yytext); }
{numero}			{ printf("%d: %s -> NUM\n", yylineno, yytext); }
{identificador}	{ printf("%d: %s -> ID\n", yylineno, yytext); }

[ \t\n]			{ }
.				{ printf("%d: %s -> UNKNOWN\n", yylineno, yytext); }
%%

int main() { yylex(); return 0; }

/* Definindo esta funcao nao precisa compilar com -lfl */
int yywrap() { return 1; }
