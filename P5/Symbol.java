// Symbol class definition
// This class represents lexical tokens in the TinyC++ programming language.
// Token values for keywords and multi-character operators are assigned numbers starting from 256,
// while single-character tokens retain their ASCII values.

public class Symbol {
    public static final int EOF         = -1;
  
    // Keywords (assigned values starting at 256)
    public static final int INCLUDE     = 256;  // represents "#include"
    public static final int USING       = 257;
    public static final int NAMESPACE   = 258;
    public static final int STD         = 259;
    public static final int CLASS       = 260;
    public static final int PUBLIC      = 261;
    public static final int RETURN      = 262;
    public static final int IF          = 263;
    public static final int ELSE        = 264;
    public static final int WHILE       = 265;
    public static final int CIN         = 266;
    public static final int COUT        = 267;
    public static final int INT         = 268;  // for the "int" keyword
  
    // Identifier and literal tokens
    public static final int ID          = 269;
    public static final int INTEGER     = 270;
  
    // Multi-character operators (assigned arbitrary unique values)
    public static final int LE          = 271;  // <=
    public static final int GE          = 272;  // >=
    public static final int EQ          = 273;  // ==
    public static final int NE          = 274;  // !=
    public static final int AND         = 275;  // &&
    public static final int OR          = 276;  // ||
    public static final int STREAM_INSERT = 277; // <<
    public static final int STREAM_EXTRACT = 278; // >>
  
    // Single-character operators and punctuation (using their ASCII values)
    public static final int ASSIGN      = '=';  // assignment operator
    public static final int PLUS        = '+';
    public static final int MINUS       = '-';
    public static final int TIMES       = '*';
    public static final int SLASH       = '/';
    public static final int LT          = '<';  // also used in include directive
    public static final int GT          = '>';
    public static final int LPAREN      = '(';
    public static final int RPAREN      = ')';
    public static final int LBRACE      = '{';
    public static final int RBRACE      = '}';
    public static final int LBRACKET    = '[';
    public static final int RBRACKET    = ']';
    public static final int COMMA       = ',';
    public static final int PERIOD      = '.';
    public static final int SEMICOLON   = ';';
  
    // Preprocessor symbol (for '#' in "#include")
    public static final int HASH        = 279;
  }
  