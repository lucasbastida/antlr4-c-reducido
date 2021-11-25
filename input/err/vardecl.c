int x;

/*error: conflicting types for ‘x’*/
/*error: ‘y’ undeclared here (not in a function)*/
double x = y;
char a, b, c;

/*error: initializer element is not constant*/
int x = 5, y, z = x, w;

/*error: ‘a’ redeclared as different kind of symbol*/
void a(int);
/*error: ‘c’ redeclared as different kind of symbol*/
/*error: ‘void’ must be the only parameter*/
double c(double, int a, void);

double c(double a,int b){
/*return 0.0;*/
}