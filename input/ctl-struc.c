int x;
double x = 2;
char a, b, c;

void add();

void add()
{
    int d = 1;
    d = d + 1;
}

int main()
{
    int x = 5, y, z = x, w;
    while (x < y)
    {
        z = z + 5;
        w = z;
    }
    for (x = 0; x < 10; x = x + 1)
        w = w + x;
    if (z == 0)
        w = x;
    else
    {
        w = z;
        z = x;
    }
    return 0;
}

void addconparam(int a, int b)
{
    int x = 5, y, z = x, w;
    while (x < y)
    {
        z = z + 5;
        w = z;
    }
    for (x = 0; x < 10; x = x + 1)
        w = w + x;
    if (z == 0)
        w = x;
    else
    {
        w = z;
        z = x;
    }
    return;
}

void addconparam(int, int);
