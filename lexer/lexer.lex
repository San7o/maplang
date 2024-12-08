%{

#define YY_NO_UNPUT
#include <parser.tab.h>

int yyerror(char *s);

%}

digit        [0-9]

%%

[ \t]*       {}
[\n]         { yylineno++; }
