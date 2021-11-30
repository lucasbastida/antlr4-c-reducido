grammar compiladores;

prog: instructions? EOF;

instructions: inst+ ;

inst
    :declarations
    |';'
    ;

//https://en.cppreference.com/w/c/language/statements
statements
    : compoundStatements
    | exprStatements
    | selectionStatements
    | iterationStatements
    | jumpStatements
    | typeDeclaration
    ;

jumpStatements
    : breakStatement
    | continueStatement
    | returnStatement
    ;

returnStatement: 'return' expr? ';';

continueStatement: 'continue' ';';

breakStatement: 'break' ';';

iterationStatements
    : whileLoop
    | forLoop
    ;

forLoop: 'for' '(' initClause ';' expr? ';' expr? ')' statements;

initClause: expr?;

whileLoop: 'while' '(' expr ')' statements;

selectionStatements
    : 'if' '(' expr ')' statements
    | 'if' '(' expr ')' statements 'else' statements
    ;

exprStatements
    : expr ';'
    | nullStatement
    ;

nullStatement: ';';

compoundStatements: '{' (declarations|statements)* '}';

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

functionDefinition: typeSpecifier declorator '(' parameterList? ')' statements;

parameterTypeList: typeSpecifier declorator? (',' typeSpecifier declorator?)*;

parameterList: typeSpecifier declorator (',' typeSpecifier declorator)*;


declorator: ID;


typeSpecifier
    : INT
    | DOUBLE
    | CHAR
    | VOID
    ;

// comparison operators, prof. pref BNF and not EBNF (keep regex syntax in lexer)
//https://en.cppreference.com/w/c/language/expressions
expr: oal;
/* OPERACIONES ARITMETICO LOGICAS */
oal: oplogica ;

oplogica: prop or;

or: '||' oplogica
  |
  ;

prop: opcomp and ;

and: '&&' opcomp and
   |
   ;

opcomp: comp opigualdad;

opigualdad
  : '==' opcomp
  | '!=' opcomp
  |
  ;

comp: oparit oprela;

oprela
  : '>' oparit oprela
  | '<' oparit oprela
  | '<=' oparit oprela
  | '>=' oparit oprela
  |
  ;

oparit: term t;

t : SUMA oparit
  | RESTA oparit
  |
  ;

term : factor f
     ;

f : MULT factor f
  | DIV  factor f
  |
  ;

factor : NUM                        #Int
       | ID '=' expr                #SimpleAssignment
       | ID                         #Var
       | ID '(' exprList? ')'       #FnCall
       | '(' oal ')'                #Paren
       ;


exprList : expr (',' expr)* ;

SUMA   : '+' ;
RESTA  : '-' ;
MULT   : '*' ;
DIV    : '/' ;

COMMA: ',';
PYC: ';';
ASSIGN: '=';

INT: 'int';
DOUBLE: 'double';
CHAR: 'char';
VOID: 'void';


fragment NUMB: [0-9]+ ;

NUM
    : '-'? NUMB? '.' NUMB 
    | '-'? NUMB
    ;

ID : [a-zA-Z_] [a-zA-Z0-9_]* ;

BLOCKCOMMENT: '/*' .*? '*/' -> skip;
WS: [ \t\n\r]+ -> skip;
OTRO: . ;