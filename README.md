1.a) Cuando se ejecuta el programa con hilos, el tiempo de duracion del programa era de al rededor de 4 segundos, tardando menos que sin hilos, donde tardaban al rededor de 7 segundos.
En ambos casos, el tiempo se puede aproximar, ya que ninguno de los programas, tanto el con hilos como el sin hilos, varia de los 4 y 7 segundos, mas sus decimas son aleatorias.

b) En el caso de mi compañero, los tiempos fueron diferentes, mas no por tanto ya que habia una diferencia de un segundo entre sus programas y los mios. Ademas seguian siendo igual de constantes que los mios (el tiempo era siempre el mismo, pero las decimas no).

c) El valor final cambio drasticamente, paso de dar 0 constantemente a dar numeros cercanos al -50000 hasta 50000. Esto sucede porque cuando se descomenta el código, se introducen unos bucles adicionales que no hacen nada, lo que aumenta el tiempo de ejecución.

2.a) 
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#define NUMBER_OF_THREADS 2
#define CANTIDAD_INICIAL_HAMBURGUESAS 20
int cantidad_restante_hamburguesas = CANTIDAD_INICIAL_HAMBURGUESAS;
int turno = 0;

void *comer_hamburguesa(void *tid)
{
	while (1 == 1)
	{ 
		while(turno!=(int)tid);

    // INICIO DE LA ZONA CRÍTICA
		if (cantidad_restante_hamburguesas > 0)
		{
			printf("Hola! soy el hilo(comensal) %d , me voy a comer una hamburguesa ! ya que todavia queda/n %d \n", (int) tid, cantidad_restante_hamburguesas);
			cantidad_restante_hamburguesas--; // me como una hamburguesa
		}
		else
		{
			printf("SE TERMINARON LAS HAMBURGUESAS :( \n");
			turno = (turno + 1)% NUMBER_OF_THREADS;
			pthread_exit(NULL); // forzar terminacion del hilo
		}
    // SALIDA DE LA ZONA CRÍTICA   
		turno = (turno + 1)% NUMBER_OF_THREADS;
	}
}

int main(int argc, char *argv[])
{
	pthread_t threads[NUMBER_OF_THREADS];
	int status, i, ret;
	for (int i = 0; i < NUMBER_OF_THREADS; i++)
	{
		printf("Hola!, soy el hilo principal. Estoy creando el hilo %d \n", i);
		status = pthread_create(&threads[i], NULL, comer_hamburguesa, (void *)i);
		if (status != 0)
		{
			printf("Algo salio mal, al crear el hilo recibi el codigo de error %d \n", status);
			exit(-1);
		}
	}

	for (i = 0; i < NUMBER_OF_THREADS; i++)
	{
		void *retval;
		ret = pthread_join(threads[i], &retval); // espero por la terminacion de los hilos que cree
	}
	pthread_exit(NULL); // como los hilos que cree ya terminaron de ejecutarse, termino yo tambien.
}
