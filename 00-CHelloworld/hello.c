#include <stdio.h>
#include <stdlib.h>
int main()
{
    // Abro el archivo "output.txt" en modo de escritura
    FILE* file = freopen("output.txt", "w", stdout);
    
    // Imprimo "hello world!" en stdout
    printf("hello world!");
    
    // Cierro el archivo y lo redirijo lo escrito al stdout
    fclose(file);
    freopen("/dev/tty", "w", stdout);
    
    return 0;
}