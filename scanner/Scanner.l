%{
    #include "y.tab.h"
    void yyerror (char *s);
    int yylex();

    typedef enum {false, true} bool;

%}



%%

"&&"                        {return T_AND;};
"||"                        {return T_OR;};

"<="                        {return T_LEQ;};
">="                        {return T_GEQ;};
"<"                         {return T_LT;};
">"                         {return T_GT;};
"=="                        {return T_EQ;};
"!="                        {return T_NEQ;};
"!"                         {return T_NOT;};

"%"                         {return T_MOD;}
"*"                         {return T_MULT;}
"/"                         {return T_DIV;}
"+"                         {return T_PLUS;}
"-"                         {return T_MINUS;}

"="                         {return T_ASSIGN;}

"("                         {return T_LPAREN;}
")"                         {return T_RPAREN;}
"["                         {return T_LSB;}
"]"                         {return T_RSB;}
"{"                         {return T_LCB;}
"}"                         {return T_RCB;}

"class"                     {return T_CLASS;}
"void"                      {return T_VOID;}
"Program"                   {return T_PROGRAM;}

"bool"                      {return T_BOOLTYPE;}
"int"                       {return T_INTTYPE;}

"return"                    {return T_RETURN;}
"break"                     {return T_BREAK;}
"continue"                  {return T_CONTINUE;}

"while"                     {return T_WHILE;}
"for"                       {return T_FOR;}
"if"                        {return T_IF;}
"else"                      {return T_ELSE;}

";"                         {return T_SEMICOLON;}
"\""                        {return T_QUOTE;}
","                         {return T_COMMA;}

[0-9][0-9]*                 {yylval.integer = atoi( yytext ); return T_INTLIERAL;}
"\'"[a-zA-Z]"\'"            {yylval.character = yytext[0] ; return T_CHARLITERAL;}
"\""[a-zA-Z][a-zA-Z]*"\""   {yylval.string = (char *) strdup(yytext); return T_STRINGLITERAL;}

"true"                      {yylval.boolean = 1 ; return T_BOOLLITERAL;}
"false"                      {yylval.boolean = 1 ; return T_BOOLLITERAL;}


[_a-zA-Z][_a-zA-Z0-9]*      {yylval.id = (char *) strdup(yytext); return T_ID;}


[ \n\t\r]+                   ;

.                           {ECHO; yyerror ("unexpected character");}

%%

int yywrap(void)
{
    return 1;
}