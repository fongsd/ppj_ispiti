%option noyywrap
%option noinput
%option nounput

%{

    #include <iostream>
    #include <cstdlib>
    #include <string>
    #include <cstring>
    using namespace std;
    
    #include "parser.tab.hpp"
    
%}

%%

"print" {
    return print_token;
}
(\"[^"]*\") {
    yylval.s = new string(yytext);
    return niska_token;
}

[a-zA-Z][a-zA-Z0-9_]* {
    yylval.s = new string(yytext);
    return id_token;
}
[1-9][0-9]* {
    yylval.d = atoi(yytext);
    return broj;
}

[)(+\n] {
    return *yytext;
}

":=" {
    return op_dodele;
}
[ \t] {

}

. {

}

%%
