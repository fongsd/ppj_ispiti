%option noyywrap
%option noinput
%option nounput

%{

    #include <iostream>
    #include <cstdlib>
    #include <string>

    using namespace std;

    #include "parser.tab.hpp"

%}

%%
"int" {
    return int_token;
}
(0|[1-9][0-9]*) {
    yylval.d = atoi(yytext);
    return broj;
}

0x[1-9ABCDEF]+[0-9A-F] { 
    sscanf(yyext, "%x", &yylval.d);
    return broj;
}

0(0|[1-7][0-7]*) {
    sscanf(yytext, "%o", &yylval.d);
    return broj;
}

[+*/&|%~,;()\[\]=-] {
    return *yytext;
}

"<<" {
    return left_shift;
}
">>" {
    return right_shift;
}

"==" {
    return rel_op;
}

"print" {
    return print_token;
}

_[a-zA-Z][a-zA-Z0-9]+ {
    yylval.s = new string(yytext);
    return id_token;
}

l[a-zA-Z0-9_]+ {
    yylval.s = new string(yytext);
    return list_id;
}

[ \t\n] {

}

. {
    cerr<<"leksicka greska"<<endl;
    exit(EXIT_FAILURE);
}

%%

