#include <stdio.h>
#include <stdlib.h>

extern void matrix(int (*A)[], int (*B)[], int (*C)[], int index);

extern void my_matrix(int **A, int **B, int **C, int *D);

int main(){
	int D[3]; // D[0] : s, D[1] : u, D[2] : v
	int **A, **B, **C;
	int i, j, k;
	
	printf("\nInput value of D(s, u, v) : ");
	for (i = 0; i < 3; i++)
		D[i] = getchar() - '0';
	printf("\ns : %d, u : %d, v : %d\n", D[0], D[1], D[2]);
	getchar();

	A = malloc(sizeof(int *) * D[0]);
	for (i = 0; i < D[0]; i++)
		A[i] = malloc(sizeof(int) * D[1]);

	B = malloc(sizeof(int *) * D[1]);
	for (i = 0; i < D[1]; i++)
		B[i] = malloc(sizeof(int) * D[2]);
	
	C = malloc(sizeof(int *) * D[0]);
	for (i = 0; i < D[0]; i++)
		C[i] = malloc(sizeof(int) * D[2]);

		
	printf("\nInput value of A : ");
	for(i=0; i < D[0]; i++){
		for(j=0; j < D[1]; j++){       
			A[i][j] = getchar()-'0';
		}
	}
	j=0; i=0;
	getchar();
		
	printf("\nInput value of B : ");
	for(j=0; j < D[1]; j++){
		for(k=0; k < D[2]; k++){       
			B[j][k] = getchar()-'0';
		}
	}
	k=0; j=0;	
		
	printf("\nArray A \n");
	for(i=0; i < D[0]; i++){
		for(j=0; j < D[1]; j++){  
		printf("%d ",A[i][j]);
		}
		printf("\n");	
	}
	i=0;
	j=0;
		
	printf("Array B \n");
	for(j=0; j < D[1]; j++){
		for(k=0; k < D[2]; k++){   
		printf("%d ",B[j][k]);
		}
		printf("\n");	
	}
	j=0;
	k=0;
	
	printf("start multi matrix\n");

	my_matrix( A, B, C, D);
		
	printf("Array C after Operating : \n");
	for(i=0; i < D[0]; i++){
		for(k=0; k < D[2]; k++){  
		printf("%d ",C[i][k]);
		}
		printf("\n");	
	}
	
	return 0;
}
