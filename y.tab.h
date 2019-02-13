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
    NUM = 258,
    IDENT = 259,
    PLUS = 260,
    MINUS = 261,
    TIMES = 262,
    DIV = 263,
    LPAR = 264,
    RPAR = 265,
    NL = 266,
    TRUE = 267,
    FALSE = 268,
    NOT = 269,
    AND = 270,
    OR = 271,
    EQ = 272,
    LT = 273,
    INT = 274,
    BOOL = 275,
    VAR = 276,
    CONST = 277,
    SET = 278,
    IF = 279,
    WHILE = 280,
    PV = 281,
    LCR = 282,
    RCR = 283,
    NEG = 284
  };
#endif
/* Tokens.  */
#define NUM 258
#define IDENT 259
#define PLUS 260
#define MINUS 261
#define TIMES 262
#define DIV 263
#define LPAR 264
#define RPAR 265
#define NL 266
#define TRUE 267
#define FALSE 268
#define NOT 269
#define AND 270
#define OR 271
#define EQ 272
#define LT 273
#define INT 274
#define BOOL 275
#define VAR 276
#define CONST 277
#define SET 278
#define IF 279
#define WHILE 280
#define PV 281
#define LCR 282
#define RCR 283
#define NEG 284

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 42 "parser.y" /* yacc.c:1909  */

  Type* typ;
  int num;
  char* str;
  Expr* expr;
  Declaration* decl;
  Stat* sta;
  Cmds* cmd;
  Prog* pro;

#line 123 "y.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
