grammar compiladores;

prog: instructions? EOF;

instructions: inst+ ;

inst
    :fnDef
    |decl
    |';'
    ;

//https://en.cppreference.com/w/c/language/declarations
decl: typeSpecifier declList ';';

typeSpecifier: INT|DOUBLE|CHAR|VOID;
declList: declorator (',' declorator)* ;
declorator: ID ('=' expr)?;

fnDef: typeSpecifier ID '(' ')';

expr:   ID '(' exprList? ')'    # Call
    |   expr '[' expr ']'       # Index
    |   '-' expr                # Negate
    |   '!' expr                # Not
    |   expr '*' expr           # Mult
    |   expr ('+'|'-') expr     # AddSub
    |   expr '==' expr          # Equal
    |   ID                      # Var
    |   NUM                     # Int
    |   '(' expr ')'            # Parens
    ;

exprList : expr (',' expr)* ;


COMMA: ',';
PYC: ';';
ASSIGN: '=';

INT: 'int';
DOUBLE: 'double';
CHAR: 'char';
VOID: 'void';

NUM :   [0-9]+ ;
ID : [a-zA-Z_] [a-zA-Z0-9_]* ;

BLOCKCOMMENT: '/*' .*? '*/' -> skip;
WS: [ \t\n\r]+ -> skip;
OTRO: . ;

