
%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"

// Variáveis globais para armazenar números
int yylval_int;
double yylval_real;

%}

DIGIT       [0-9]
LETTER      [a-zA-Z_]
INTEGER     {DIGIT}+
REAL        {DIGIT}+"."{DIGIT}+

%%
// Operadores básicos
"+"         { return PLUS; }
"-"         { return MINUS; }
"*"         { return MULT; }
"/"         { return DIV; }
"%"         { return MOD; }
"**"        { return POW; }

// Operadores bit a bit
"&"         { return BIT_AND; }
"|"         { return BIT_OR; }
"^"         { return BIT_XOR; }
"~"         { return BIT_NOT; }
">>"        { return BIT_SHR; }
"<<"        { return BIT_SHL; }

// Parênteses
"("         { return LPAREN; }
")"         { return RPAREN; }

// Incremento e Decremento
"++"        { return INC; }
"--"        { return DEC; }

// Cast
"[(]"       { return CAST_OPEN; }
"int"       { return TYPE_INT; }
"[)]"       { return CAST_CLOSE; }

// Atribuição
"="          { return ASSIGN; }

// Números
{INTEGER}   { yylval_int = atoi(yytext); return INT; }
{REAL}      { yylval_real = atof(yytext); return REAL; }

// Variáveis
{LETTER}({LETTER}|{DIGIT})* {
    yylval = strdup(yytext);
    return ID;
}

// Comandos especiais
"@CLEAR"         { return CLEAR; }
"@CLEAR INT"     { return CLEAR_INT; }
"@CLEAR REAL"    { return CLEAR_REAL; }
"@CLEAR "({LETTER}({LETTER}|{DIGIT})*) {
    yylval = strdup(yytext + 7); // Ignorar "@CLEAR "
    return CLEAR_VAR;
}

"@LIST"          { return LIST; }
"@LIST INT"      { return LIST_INT; }
"@LIST REAL"     { return LIST_REAL; }
"@LIST "({LETTER}({LETTER}|{DIGIT})*) {
    yylval = strdup(yytext + 6); // Ignorar "@LIST "
    return LIST_VAR;
}

// Ignorar espaços em branco e tabs
[ 	
]+         { /* Ignorar */ }

.               { printf("Caractere inválido: %s
", yytext); }

%%

int yywrap() {
    return 1;
}
