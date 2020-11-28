/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    T_AND = 258,
    T_OR = 259,
    T_LEQ = 260,
    T_GEQ = 261,
    T_LT = 262,
    T_GT = 263,
    T_EQ = 264,
    T_NEQ = 265,
    T_NOT = 266,
    T_MOD = 267,
    T_MULT = 268,
    T_DIV = 269,
    T_PLUS = 270,
    T_MINUS = 271,
    T_ASSIGN = 272,
    T_LPAREN = 273,
    T_RPAREN = 274,
    T_LSB = 275,
    T_RSB = 276,
    T_LCB = 277,
    T_RCB = 278,
    T_CLASS = 279,
    T_VOID = 280,
    T_PROGRAM = 281,
    T_BOOLTYPE = 282,
    T_INTTYPE = 283,
    T_RETURN = 284,
    T_BREAK = 285,
    T_CONTINUE = 286,
    T_WHILE = 287,
    T_FOR = 288,
    T_IF = 289,
    T_ELSE = 290,
    T_SEMICOLON = 291,
    T_QUOTE = 292,
    T_COMMA = 293,
    T_INTLIERAL = 294,
    T_CHARLITERAL = 295,
    T_BOOLLITERAL = 296,
    T_STRINGLITERAL = 297,
    T_ID = 298
  };
#endif
/* Tokens.  */
#define T_AND 258
#define T_OR 259
#define T_LEQ 260
#define T_GEQ 261
#define T_LT 262
#define T_GT 263
#define T_EQ 264
#define T_NEQ 265
#define T_NOT 266
#define T_MOD 267
#define T_MULT 268
#define T_DIV 269
#define T_PLUS 270
#define T_MINUS 271
#define T_ASSIGN 272
#define T_LPAREN 273
#define T_RPAREN 274
#define T_LSB 275
#define T_RSB 276
#define T_LCB 277
#define T_RCB 278
#define T_CLASS 279
#define T_VOID 280
#define T_PROGRAM 281
#define T_BOOLTYPE 282
#define T_INTTYPE 283
#define T_RETURN 284
#define T_BREAK 285
#define T_CONTINUE 286
#define T_WHILE 287
#define T_FOR 288
#define T_IF 289
#define T_ELSE 290
#define T_SEMICOLON 291
#define T_QUOTE 292
#define T_COMMA 293
#define T_INTLIERAL 294
#define T_CHARLITERAL 295
#define T_BOOLLITERAL 296
#define T_STRINGLITERAL 297
#define T_ID 298

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 42 "./parser/Parser.y" /* yacc.c:1909  */
int integer; char character; int boolean; char *string; char *id;

#line 143 "y.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
