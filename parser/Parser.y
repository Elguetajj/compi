%{
void yyerror (char *s);
int yylex(); 
#include <stdio.h>     /* C declarations used in actions */
#include <stdlib.h>
#include <ctype.h>
#include <string.h>
#include "./semantic/SymbolTable.h"
int symbolVal(char symbol);
void updateSymbolVal(char symbol, int val);
extern FILE *yyin;  
int errors;

install (STAction action ,char *sym_name )
{ 
	symbol *s;
	s = getsymInContext (sym_name);
	if (s == 0){
		s = putsym (action,sym_name);
	}else { 
		errors++;
		printf( "%s is already defined\n", sym_name );
	}
}

context_check(char *sym_name)
{ 
	// printf("context check:%s\n",sym_name);
	symbol *identifier;
	identifier = getsym( sym_name );
	if ( identifier == 0 )
	{ 
		errors++;
		printf( "%s", sym_name );
		printf( "%s\n", " is an undeclared identifier" );
	}
} 


%}

%union {int integer; char character; int boolean; char *string; char *id;}   

%start program

%token T_AND
%token T_OR
%token T_LEQ
%token T_GEQ
%token T_LT
%token T_GT
%token T_EQ
%token T_NEQ
%token T_NOT
%token T_MOD
%token T_MULT
%token T_DIV
%token T_PLUS
%token T_MINUS
%token T_ASSIGN
%token T_LPAREN
%token T_RPAREN
%token T_LSB
%token T_RSB
%token T_LCB
%token T_RCB
%token T_CLASS
%token T_VOID
%token T_PROGRAM
%token T_BOOLTYPE
%token T_INTTYPE
%token T_RETURN
%token T_BREAK
%token T_CONTINUE
%token T_WHILE
%token T_FOR
%token T_IF
%token T_ELSE
%token T_SEMICOLON
%token T_QUOTE
%token T_COMMA

%token <integer> T_INTLIERAL
%token <character> T_CHARLITERAL
%token <boolean> T_BOOLLITERAL
%token <string> T_STRINGLITERAL
%token <id> T_ID

%%
program					: T_CLASS T_PROGRAM decls
						;

decls					: T_LCB field_decls method_decls T_RCB
						| T_LCB method_decls field_decls T_RCB
						;

field_decls				: %empty
						| field_decls var_decl
						;

var_decl 				: type T_ID T_LSB literal T_RSB T_SEMICOLON
						| type T_ID T_SEMICOLON														{install(NEW_SYBMOL,$2);}
						| list_decl T_SEMICOLON
						;

var_decls				: %empty
						| var_decls var_decl
						;

list_decl 				: type T_ID
						| list_decl T_COMMA T_ID
						;

method_decls			: %empty
						| method_decls method_decl 
						;

method_decl				: T_VOID T_ID T_LPAREN method_args T_RPAREN block
						| type T_ID T_LPAREN method_args T_RPAREN block
						| method_decl type T_ID T_LPAREN method_args T_RPAREN block
						| method_decl T_VOID T_ID T_LPAREN method_args T_RPAREN block
						;

method_args				: %empty
						| type T_ID
						| method_args T_COMMA type T_ID
						;

block 					: T_LCB var_decls statements T_RCB 																																												
						;

statements				: %empty
						| statements statement

statement 				: T_ID T_ASSIGN expr T_SEMICOLON											{context_check($1);}																				
						| method_call T_SEMICOLON
						| T_IF T_LPAREN expr T_RPAREN												{install(PUSH_SCOPE,"scope_nuevo");}
							block 																	{install(POP_SCOPE,"scope");}
							else_statement   					
						| T_FOR T_ID T_ASSIGN expr T_COMMA expr block
						| T_RETURN expr T_SEMICOLON
						| T_BREAK T_SEMICOLON
						| T_CONTINUE T_SEMICOLON   
						;

else_statement			: %empty
						| T_ELSE 																	{install(PUSH_SCOPE,"scope_nuevo");}
							block 																	{install(POP_SCOPE,"scope");}                                                        
						;

method_call 			: T_ID T_LPAREN method_call_args T_RPAREN
						;

method_call_args		: %empty
						| expr
						| expr method_call_args_list
						;
 
method_call_args_list	: %empty
						| method_call_args_list T_COMMA expr
						;

expr 					: expr bin_op expr
						| T_ID																	{context_check($1);}
						| method_call
						| literal
						| T_MINUS expr
						| T_NOT expr
						| T_LPAREN expr T_RPAREN
						;

location				: T_ID																{context_check($1);}																	
						| T_ID T_LSB expr T_RSB
						;

bin_op 					: arith_op
						| rel_op
						| eq_op
						| cond_op
						;

arith_op 				: T_PLUS
						| T_MINUS
						| T_MULT
						| T_DIV
						| T_MOD
						;

rel_op					: T_LT
 						| T_GT
 						| T_LEQ
 						| T_GEQ
						;

eq_op 					: T_EQ
						| T_NEQ
						;

cond_op 				: T_AND
						| T_OR
						;

literal					: T_INTLIERAL
						| T_CHARLITERAL
						| T_STRINGLITERAL
						| T_BOOLLITERAL
						;

type					: T_BOOLTYPE
						| T_INTTYPE
						;

%%                     /* C code */



main( int argc, char *argv[] )
{
	extern FILE *yyin;
	++argv; --argc;
	yyin = fopen( argv[0], "r" );
	yyparse ();
}

void yyerror (char *s) {fprintf (stderr, "%s\n", s);} 
