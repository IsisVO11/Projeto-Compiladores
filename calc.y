/* calc.y - YACC source file */
%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>

#include "symtable.h"

int yylex();
void yyerror(const char *s);
%}

%union {
    int iVal;
    double dVal;
    char sIndex[32];
}

%token <iVal> INT
%token <dVal> REAL
%token <sIndex> ID

%token PLUS MINUS MULT DIV MOD
%token POWER
%token BIT_AND BIT_OR BIT_XOR BIT_NOT BIT_LSHIFT BIT_RSHIFT
%token INCREMENT DECREMENT CAST
%token ASSIGN
%token LPAREN RPAREN
%token CLEAR LIST

%type <iVal> int_expr
%type <dVal> real_expr
%type <dVal> expr

%%

input:
      | input line
      ;

line:
      expr '\n' { printf("= %g\n", $1); }
    | ID ASSIGN expr '\n' { add_symbol($1, $3); printf("%s = %g\n", $1, $3); }
    | CLEAR '\n' { clear_all(); }
    | CLEAR ID '\n' { clear_symbol($2); }
    | CLEAR INT '\n' { clear_int(); }
    | CLEAR REAL '\n' { clear_real(); }
    | LIST '\n' { list_all(); }
    | LIST ID '\n' { list_symbol($2); }
    | LIST INT '\n' { list_int(); }
    | LIST REAL '\n' { list_real(); }
    ;

expr:
      int_expr { $$ = $1; }
    | real_expr { $$ = $1; }
    ;

int_expr:
      INT { $$ = $1; }
    | ID { $$ = get_symbol($1); }
    | int_expr PLUS int_expr { $$ = $1 + $2; }
    | int_expr MINUS int_expr { $$ = $1 - $2; }
    | int_expr MULT int_expr { $$ = $1 * $2; }
    | int_expr DIV int_expr { if ($2 == 0) yyerror("Division by zero"); else $$ = $1 / $2; }
    | int_expr MOD int_expr { if ($2 == 0) yyerror("Modulo by zero"); else $$ = $1 % $2; }
    | int_expr BIT_AND int_expr { $$ = $1 & $2; }
    | int_expr BIT_OR int_expr { $$ = $1 | $2; }
    | int_expr BIT_XOR int_expr { $$ = $1 ^ $2; }
    | int_expr BIT_LSHIFT int_expr { $$ = $1 << $2; }
    | int_expr BIT_RSHIFT int_expr { $$ = $1 >> $2; }
    | BIT_NOT int_expr { $$ = ~$2; }
    | MINUS int_expr { $$ = -$2; }
    | INCREMENT ID { $$ = get_symbol($2) + 1; add_symbol($2, $$); }
    | DECREMENT ID { $$ = get_symbol($2) - 1; add_symbol($2, $$); }
    | LPAREN int_expr RPAREN { $$ = $2; }
    ;

real_expr:
      REAL { $$ = $1; }
    | ID { $$ = get_symbol($1); }
    | real_expr PLUS real_expr { $$ = $1 + $2; }
    | real_expr MINUS real_expr { $$ = $1 - $2; }
    | real_expr MULT real_expr { $$ = $1 * $2; }
    | real_expr DIV real_expr { if ($2 == 0.0) yyerror("Division by zero"); else $$ = $1 / $2; }
    | MINUS real_expr { $$ = -$2; }
    | POWER real_expr real_expr { $$ = pow($1, $2); }
    | LPAREN real_expr RPAREN { $$ = $2; }
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
