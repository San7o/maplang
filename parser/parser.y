%{

/* c declarations */
#include <stdio.h>
#include <stdlib.h>
#include <parser.tab.h>

int yyerror(char* err);
int yylex(void);

%}

/* bison declarations */
%union {
  int num;
  char* name;
  char* version;
  char* description;
  char* dependency;
  char* output;
  char* config;
  char* download;
  char* install;
  char* clean;
  char* remove;
}

%token NUM
%token NAME
%token VERSION
%token DESCRIPTION
%token DEPENDENCY
%token OUTPUT
%token CONFIG
%token DOWNLOAD
%token INSTALL
%token CLEAN
%token REMOVE
%left '+' '-'
%left '*' '/'

%%

/* grammar rules */
package :
    name
    version
    description
    dependencies
    output
    configs
    download
    install
    clean
    remove
    ;

name:
    "name " NAME ","
    ;

version:
    "version " VERSION ',' |
    ;
description:
    "description " DESCRIPTION ',' |
    ;
dependencies:
    "dependencies [" dependencies_list ']' |
    ;
dependencies_list:
    DEPENDENCY dependencies_list |
    ;
output:
    "output " OUTPUT ',' |
    ;
configs:
    "configs [" configs_list ']' |
    ;
configs_list:
    CONFIG configs_list |
    ;
download:
    "download {" DOWNLOAD "}" |
    ;
install:
    "install {" INSTALL "}" |
    ;
clean:
    "clean {" CLEAN "}" |
    ;
remove:
    "remove {" REMOVE "}" |
    ;

%%

int yyerror(char *err)
{
  fprintf(stderr, "Error: %s", err);
  exit(1);
}

/* lexer */
int yylex(void)
{
  return NUM;
}

/* additional c code */
int main(void)
{
  yyparse();
  return 0;
}
