#include <stdio.h>
#include <stdlib.h>

int imprimir(int *v){
	int i;
	for (i=0;i<5;i++){
		printf("%d\n", v[i]);
	}
}

int main(int argc, char *argv[]){
	int a[] = {1,2,3,4,5};
	int *p; //define un puntero a p
	p = &a[0]; //apunta a "a" en la posicion 0
	imprimir(p);
	return 0;
}
