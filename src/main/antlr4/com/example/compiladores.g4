grammar compiladores;

prog: instructions? EOF;

instructions: inst+ ;

inst
    :declarations
    |';'
    ;

//https://en.cppreference.com/w/c/language/declarations
declarations
    : typeDeclaration
    | function
    ;

typeDeclaration: typeSpecifier decloratorList ';' ;

decloratorList: decloratorInitializer (',' decloratorInitializer)* ;

decloratorInitializer: declorator ('=' expr)?;

function
    : functionDeclaration
    | functionDefinition
    ;

functionDeclaration: typeSpecifier declorator '(' parameterTypeList? ')' ';';

functionDefinition: typeSpecifier declorator '(' parameterList? ')' '{' '}';

parameterTypeList: typeSpecifier declorator? (',' typeSpecifier declorator?)*;

parameterList: typeSpecifier declorator (',' typeSpecifier declorator)*;


declorator: ID;

typeSpecifier
    : INT
    | DOUBLE
    | CHAR
    | VOID
    ;

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

