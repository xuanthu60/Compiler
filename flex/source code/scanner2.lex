%{
#include<string.h>
#include <ctype.h>
%}

DIGIT    [0-9]
ID       [a-zA-Z][A-Za-z0-9]*


%%


{DIGIT}+    {
	int value = 0;
	int i= 0; 
	
	if (yyleng > 9) {
		   printf("\nSo qua lon %s",yytext);
	}
	else{ 
		value = value*10 + yytext[i]-48;	
		i=i+1;		
		while(i<yyleng){
			value = value*10 + yytext[i]-48;
			i = i + 1; 
		}	
		printf("\nNUMBER: %d", value);
	}

        }

BEGIN|CALL|CONST|DO|ELSE|END|FOR|IF|ODD|PROCEDURE|PROGRAM|THEN|TO|VAR|WHILE     {
		int i2;  char kw[11];
		for (i2 = 0; i2 < yyleng; ++i2) kw[i2] = toupper(yytext[i2]);
		kw[i2] = '\0';
        printf("\n%s", kw );
        }


{ID}        {
		char s[11];
		int i=0;
		if(strlen(yytext) >=10){
			while(i<10){
				s[i] = yytext[i];
				//printf("\nIDENT: %c", yytext[i] );	
				i+=1;		
			}
			s[i]='\0';
			printf("\nIDENT: %s", s );			
		}else
			printf("\nIDENT: %s", yytext );

	}
[ \t\n]+  ;
"+"       printf( "\nPLUS");
"-"       printf( "\nMINUS");
"*"       printf( "\nTIMES");
"/"       printf( "\nSLASH");
"<>"      printf( "\nNEQ");
"<="      printf( "\nLEQ");
"<"       printf( "\nLSS");
">="      printf( "\nGEQ");
">"       printf( "\nGRT");
":="      printf( "\nASSIGN");
"%"       printf( "\nPERCENT");
"="       printf( "\nEQU");
"("       printf( "\nLPARENT");
")"       printf( "\nRPARENT");
"["       printf( "\nLBRACK");
"]"       printf( "\nRBRACK");
"."       printf( "\nPERIOD");
","       printf( "\nCOMMA");
";"       printf( "\nSEMICOLON");
. 	  	  printf( "\nNONE");


%%


int main( int argc, char **argv )
{
++argv, --argc;  /* skip over program name */
if ( argc > 0 )
        yyin = fopen( argv[0], "r" );
else
        yyin = stdin;

yylex();
}
