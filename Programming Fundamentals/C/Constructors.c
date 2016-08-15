#include <stdio.h>
#include <stdlib.h>

/* run this program using the console pauser or add your own getch, system("pause") or input loop */

struct alumno{
	int codigo;
	char *nombre; 
	int nota;
};

int main(int argc, char *argv[]) {
	
	struct alumno e1, e2;
	e1.codigo = 100;
	e1.nombre = "Juan";
	e1.nota = 20;
	e2.codigo = 110;
	e2.nombre = "Diana";
	e2.nota = 15;
	
	printf("Primer alumno\n");
	printf("Codigo %d\n", e1.codigo);
	printf("Nombre %s\n", e1.nombre);
	printf("Nota %d\n", e1.nota);
	
	printf("\nSegundo alumno\n");
	printf("Codigo %d\n", e2.codigo);
	printf("Nombre %s\n", e2.nombre);
	printf("Nota %d\n", e2.nota);
	
	return 0;
}
