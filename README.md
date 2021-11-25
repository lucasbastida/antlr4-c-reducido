# A Reduced C compiler using ANTLR4 (WIP)
The goal of the project is to build a moderate version of a C89 compiler that can produce 3 Address Code


**High-level process overview:**

Source code 
&rarr; ANTLR4 lexer/parser
&rarr; Semantic analysis with a single pass Symbol Table
&rarr; TAC

Available types:
- int
- double
- char
- void

# Simple C Reference

## Statements

1) compound statements
2) expression statements
3) selection statements
4) iteration statements
5) jump statements


# notes
No bool type in c89 (ANSI C)

# References
- https://en.cppreference.com/w/c/language
- https://github.com/lucasbastida/antlr4-base
- https://www.antlr.org/api/maven-plugin/latest/