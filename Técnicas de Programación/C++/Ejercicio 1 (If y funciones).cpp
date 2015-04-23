#include <stdio.h>
#include <stdlib.h>

int funcion(int *a, int *b){
	if (*a>=*b) return 1;
	else return 2;
}

int main(int argc, char *argv[]){
	int a, b, resp;
	a = 2;
	b = 3;
	resp = funcion(&a, &b);
	printf("%d\n", resp);
	
	return 0;
}
