%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "parser.tab.h"

void yyerror(const char *s);
%}

%option noyywrap

DIGIT      [0-9]
ID         [a-zA-Z_][a-zA-Z0-9_]*
FLOAT      {DIGIT}+\.({DIGIT}+)?
INTEGER    {DIGIT}+

%%
\n              { return '\n'; }
[ \t]+          ;
\+              { return '+'; }
-               { return '-'; }
\*              { return '*'; }
/               { return '/'; }
%               { return '%'; }
\*\*            { return POW; }
\&              { return '&'; }
\|              { return '|'; }
\^              { return '^'; }
>>              { return RSHIFT; }
<<              { return LSHIFT; }
~               { return '~'; }
\(              { return '('; }
\)              { return ')'; }
\=              { return '='; }
\+\+            { return INCR; }
--              { return DECR; }
\[(int)\]        { return CAST_INT; }

"@CLEAR"         { return CLEAR; }
"@CLEAR INT"     { return CLEAR_INT; }
"@CLEAR REAL"    { return CLEAR_REAL; }
"@CLEAR"[ \t]+{ID} { yylval.str = strdup(yytext + 7); return CLEAR_ID; }

"@LIST"          { return LIST; }
"@LIST INT"      { return LIST_INT; }
"@LIST REAL"     { return LIST_REAL; }
"@LIST"[ \t]+{ID} { yylval.str = strdup(yytext + 6); return LIST_ID; }

{FLOAT}          { yylval.fval = atof(yytext); return FLOAT; }
{INTEGER}        { yylval.ival = atoi(yytext); return INTEGER; }
{ID}             { yylval.str = strdup(yytext); return ID; }

.                { yyerror("Caractere inválido"); }
%%
