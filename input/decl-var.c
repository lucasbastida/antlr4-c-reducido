/* */
int x;


void a(int);
double c(double, int a);

double c(double a,int b){
return 0.0;
}

int main(){
c(1.0,1.0);
return 0;
}

/*int main(){
    c(expression ,expression); error: expected expression before ‘double’
    return 0;
}

double c(double,int){ error: parameter name omitted
return 0.0;
}*/

/*c89 error: undefined reference to main*/