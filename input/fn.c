int i1;
int i2, i3;
int i1;         //la variable ya existe

int a = i1;     //deberia decir que no esta inicializada
int b = c;      //la variable c no existe
int d = 1;

double d1 = 1, z=1;
double d;       //la variable d ya existe

void add(){
    d = d + 1;
}

void addconparam(int a, int b){
    d = a + b;
}

addconparam(2,3);

addconparam(2,Y);

a();       //no existe la funcion a

1/3; //asdf asdf