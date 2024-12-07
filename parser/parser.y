%{
#include <stdio.h>
#include <stdlib.h>

%}

%union {
  int num;
  char[256] name;
  char[256] version;
  char[256] description;
  char[256] dependency;
  char[256] output;
  char[256] config;
  char[256] download;
  char[256] install;
  char[256] clean;
  char[256] remove;
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

empty:
    ;

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
    empty
    ;
description:
    "description " DESCRIPTION ',' |
    empty
    ;
dependencies:
    "dependencies [" dependencies_list ']' |
    empty
    ;
dependencies_list:
    DEPENDENCY dependencies_list |
    empty
    ;
output:
    "output " OUTPUT ',' |
    empty
    ;
configs:
    "configs [" configs_list ']' |
    empty
    ;
ocnfigs_list:
    CONFIGS configs_list |
    empty
    ;
download:
    "download {" DOWNLOAD "}" |
    empty
    ;
install:
    "download {" INSTALL "}" |
    empty
    ;
clean:
    "download {" CLEAN "}" |
    empty
    ;
remove:
    "download {" REMOVE "}" |
    empty
    ;

%%

int main(void)
{
  yyparse();
  return 0;
}
