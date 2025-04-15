%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
%}

%union {
    int ival;
    float fval;
    char *sval;
}

%token <ival> INTEGER
%token <fval> REAL
%token <sval> ID
%token PLUS MINUS MULT DIV MOD
%token LPAREN RPAREN ASSIGN INC DEC CAST
%token CLEAR LIST POWER AND OR XOR LSHIFT RSHIFT NOT

%start line

%%

line:
    expr '\n' { printf("Resultado: %d\n", $1); }
    ;

expr:
    INTEGER                 { $$ = $1; }
  | REAL                    { $$ = (int)$1; }
  | expr '+' expr           { $$ = $1 + $3; }
  | expr '-' expr           { $$ = $1 - $3; }
  | expr '*' expr           { $$ = $1 * $3; }
  | expr '/' expr           { $$ = $1 / $3; }
  | expr LSHIFT expr        { $$ = $1 << $3; }
  | expr RSHIFT expr        { $$ = $1 >> $3; }
  | expr '&' expr           { $$ = $1 & $3; }
  | expr '|' expr           { $$ = $1 | $3; }
  | expr '^' expr           { $$ = $1 ^ $3; }
  | NOT expr                { $$ = ~$2; }
  | MINUS expr              { $$ = -$2; }
  | LPAREN expr RPAREN      { $$ = $2; }
  ;

%%

void yyerror(const char *msg) {
    fprintf(stderr, "Erro: %s\n", msg);
}

int main(void) {
    yyparse();
    return 0;
}