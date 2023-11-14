%{
#include <stdlib.h>
#include <stdio.h>
#include "y.tab.h" // Incluye el archivo de encabezado generado por Bison
#ifndef yywrap
static int yywrap(void) { return 1; }
#endif
%}

DIGITO [0-9]
LETRA [a-zA-Z]
IDENTIFICADOR {LETRA}({LETRA}|{DIGITO})*
constEntera {DIGITO}({DIGITO})*

%%

":=" { return ASIGNACION; }
";" { return PYCOMA; }
"(" { return PARENIZQUIERDO; }
"+" { return SUMA; }
")" { return PARENDERECHO; }
"-" { return RESTA; }
{constEntera} { yylval.num = atoi(yytext); return CONSTANTE; }
{IDENTIFICADOR} { yylval.cadena = strdup(yytext); return ID; }
. ECHO;

%%

//int main() {
//    yylex();
//    return 0;
//}
