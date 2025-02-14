import java_cup.runtime.*;
%%

%class TinyCPPLexer
%unicode
%line
%column
%cupsym Symbol
%cup
%eofval{
  return symbolFactory.newSymbol("EOF", Symbol.EOF);
%eofval}

%{
  private SymbolFactory symbolFactory;

  public TinyCPPLexer(java.io.Reader input, SymbolFactory sf) {
    this(input);
    symbolFactory = sf;
  }

  private void echo() { System.out.print(yytext()); }

  public int position() { return yycolumn; }
%}

Identifier = [:letter:]([:letter:]|[:digit:]|_)*

Integer = [:digit:]+

%%

"//".*                      { /* Skip C++ style comments */ }

[ \t\n\r]+                  { /* Skip whitespace */ }

"#include"                  { echo(); return symbolFactory.newSymbol("(preprocessor, #include)", Symbol.INCLUDE); }

"using"                    { echo(); return symbolFactory.newSymbol("(keyword, using)", Symbol.USING); }
"namespace"                { echo(); return symbolFactory.newSymbol("(keyword, namespace)", Symbol.NAMESPACE); }
"std"                      { echo(); return symbolFactory.newSymbol("(keyword, std)", Symbol.STD); }
"class"                    { echo(); return symbolFactory.newSymbol("(keyword, class)", Symbol.CLASS); }
"public"                   { echo(); return symbolFactory.newSymbol("(keyword, public)", Symbol.PUBLIC); }
"return"                   { echo(); return symbolFactory.newSymbol("(keyword, return)", Symbol.RETURN); }
"if"                       { echo(); return symbolFactory.newSymbol("(keyword, if)", Symbol.IF); }
"else"                     { echo(); return symbolFactory.newSymbol("(keyword, else)", Symbol.ELSE); }
"while"                    { echo(); return symbolFactory.newSymbol("(keyword, while)", Symbol.WHILE); }
"cin"                      { echo(); return symbolFactory.newSymbol("(keyword, cin)", Symbol.CIN); }
"cout"                     { echo(); return symbolFactory.newSymbol("(keyword, cout)", Symbol.COUT); }
"int"                      { echo(); return symbolFactory.newSymbol("(keyword, int)", Symbol.INT); }

// Multi-character operators and stream operators
"<<"                       { echo(); return symbolFactory.newSymbol("(operator, <<)", Symbol.STREAM_INSERT); }
">>"                       { echo(); return symbolFactory.newSymbol("(operator, >>)", Symbol.STREAM_EXTRACT); }
"=="                       { echo(); return symbolFactory.newSymbol("(operator, ==)", Symbol.EQ); }
"!="                       { echo(); return symbolFactory.newSymbol("(operator, !=)", Symbol.NE); }
"<="                       { echo(); return symbolFactory.newSymbol("(operator, <=)", Symbol.LE); }
">="                       { echo(); return symbolFactory.newSymbol("(operator, >=)", Symbol.GE); }
"&&"                       { echo(); return symbolFactory.newSymbol("(operator, &&)", Symbol.AND); }
"||"                       { echo(); return symbolFactory.newSymbol("(operator, ||)", Symbol.OR); }

// Single-character operators
"="                        { echo(); return symbolFactory.newSymbol("(operator, =)", Symbol.ASSIGN); }
"<"                        { echo(); return symbolFactory.newSymbol("(operator, <)", Symbol.LT); }
">"                        { echo(); return symbolFactory.newSymbol("(operator, >)", Symbol.GT); }
"!"                        { echo(); return symbolFactory.newSymbol("(operator, !)", '!'); }

// Punctuation
"("                        { echo(); return symbolFactory.newSymbol("(punctuation, ()", Symbol.LPAREN); }
")"                        { echo(); return symbolFactory.newSymbol("(punctuation, ))", Symbol.RPAREN); }
"{"                        { echo(); return symbolFactory.newSymbol("(punctuation, {)", Symbol.LBRACE); }
"}"                        { echo(); return symbolFactory.newSymbol("(punctuation, })", Symbol.RBRACE); }
"["                        { echo(); return symbolFactory.newSymbol("(punctuation, [)", Symbol.LBRACKET); }
"]"                        { echo(); return symbolFactory.newSymbol("(punctuation, ])", Symbol.RBRACKET); }
";"                        { echo(); return symbolFactory.newSymbol("(punctuation, ;)", Symbol.SEMICOLON); }
","                        { echo(); return symbolFactory.newSymbol("(punctuation, ,)", Symbol.COMMA); }
"."                        { echo(); return symbolFactory.newSymbol("(punctuation, .)", Symbol.PERIOD); }

// Arithmetic operators
"+"                        { echo(); return symbolFactory.newSymbol("(operator, +)", Symbol.PLUS); }
"-"                        { echo(); return symbolFactory.newSymbol("(operator, -)", Symbol.MINUS); }
"*"                        { echo(); return symbolFactory.newSymbol("(operator, *)", Symbol.TIMES); }
"/"                        { echo(); return symbolFactory.newSymbol("(operator, /)", Symbol.SLASH); }

// Literals
{Integer}                  { echo(); return symbolFactory.newSymbol("(integer, " + yytext() + ")", Symbol.INTEGER, yytext()); }
{Identifier}               { echo(); return symbolFactory.newSymbol("(identifier, " + yytext() + ")", Symbol.ID, yytext()); }

.                          { echo(); ErrorMessage.print(yychar, "Illegal character"); }
