// Symbol class definition
// Symbol is a class to represent lexical tokens in the PL/0 
// programming language, described in Algorithms + Data
// Structures = Programs by Niklaus Wirth, Prentice-Hall, 1976.

public class Symbol {    // token classes
  public static final int EOF       = -1;
  public static final int BEGIN     =  0;
  public static final int CALL      =  1;
  public static final int CONST     =  2;
  public static final int DO        =  3;
  public static final int END       =  4;
  public static final int IF        =  5;
  public static final int ODD       =  6;
  public static final int PROC      =  7;
  public static final int THEN      =  8;
  public static final int VAR       =  9;
  public static final int WHILE     = 10;
  public static final int ID        = 11;
  public static final int INTEGER   = 12;
  public static final int ASSIGN    = 13;
  public static final int PLUS 	    = '+';
  public static final int MINUS     = '-';
  public static final int TIMES     = '*';
  public static final int SLASH     = '/';
  public static final int EQ        = '=';
  public static final int LT        = '<';
  public static final int GT        = '>';
  public static final int NE        = GT + 1;
  public static final int LE        = NE + 1;
  public static final int GE        = LE + 1;
  public static final int LPAREN    = '(';
  public static final int RPAREN    = ')';
  public static final int COMMA     = ',';
  public static final int PERIOD    = '.';
  public static final int SEMICOLON = ';';
}
