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

#ifndef YY_YY_RUBIK_USUARIO_TAB_H_INCLUDED
# define YY_YY_RUBIK_USUARIO_TAB_H_INCLUDED
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
    MOVE = 258,
    EXITR = 259,
    SCRAMBLE = 260,
    SOLVED = 261,
    SOLVE = 262,
    RESET = 263,
    CREATE = 264,
    UIPRIME = 265,
    UI = 266,
    UPRIME = 267,
    U = 268,
    RIPRIME = 269,
    RI = 270,
    RPRIME = 271,
    R = 272,
    BIPRIME = 273,
    BI = 274,
    BPRIME = 275,
    B = 276,
    LIPRIME = 277,
    LI = 278,
    LPRIME = 279,
    L = 280,
    FIPRIME = 281,
    FI = 282,
    FPRIME = 283,
    F = 284,
    DIPRIME = 285,
    DI = 286,
    DPRIME = 287,
    D = 288,
    MYFILE = 289,
    TIMES = 290
  };
#endif
/* Tokens.  */
#define MOVE 258
#define EXITR 259
#define SCRAMBLE 260
#define SOLVED 261
#define SOLVE 262
#define RESET 263
#define CREATE 264
#define UIPRIME 265
#define UI 266
#define UPRIME 267
#define U 268
#define RIPRIME 269
#define RI 270
#define RPRIME 271
#define R 272
#define BIPRIME 273
#define BI 274
#define BPRIME 275
#define B 276
#define LIPRIME 277
#define LI 278
#define LPRIME 279
#define L 280
#define FIPRIME 281
#define FI 282
#define FPRIME 283
#define F 284
#define DIPRIME 285
#define DI 286
#define DPRIME 287
#define D 288
#define MYFILE 289
#define TIMES 290

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 18 "rubik_usuario.y" /* yacc.c:1909  */

	char * valString;
	int valInt;

#line 129 "rubik_usuario.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_RUBIK_USUARIO_TAB_H_INCLUDED  */
