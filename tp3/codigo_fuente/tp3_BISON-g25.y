%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
extern char *yytext;
extern int yyleng;
extern int yylex(void);
extern void  yyerror(char*);
int variable=0;
%}
%union{
char* cadena;
int num;
char* reservada;
}
%token ASIGNACION PYCOMA SUMA RESTA PARENIZQUIERDO PARENDERECHO
%token <cadena> ID
%token <num> CONSTANTE
%type <num> expresion
%type <num> primaria
%token <reservada> INICIO FIN LEER ESCRIBIR
%%
programa: INICIO sentencias FIN
;
sentencias: sentencias sentencia
|sentencia
;
sentencia: ID {printf("\nRUTINA SEMANTICA:\tLa longutid del ID es: %d",yyleng);if(yyleng>33)yyerror("La longitud del ID es mayor a la permitida");} ASIGNACION expresion PYCOMA
;
expresion: primaria
|expresion operadorAditivo primaria {$$ = $1 + $3;printf("\nRUTINA SEMANTICA:\tEl resultado es %d \n",$$);}
|expresion operadorResta primaria {$$ = $1 - $3;printf("\nRUTINA SEMANTICA:\tEl resultado es %d \n",$$);}
;
primaria:ID
|CONSTANTE {printf("\nValor de la constante: %d\n",$1);}
|PARENIZQUIERDO expresion PARENDERECHO
;
operadorAditivo: SUMA
;
operadorResta:RESTA
;
%%
int main(){
	yyparse();
}
void yyerror(char *s){
	printf("Motivo del error: %s\n",s);
}
int yywrap(){
	return 1;
}
