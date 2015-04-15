#include <stdio.h>
#include <stdbool.h>

bool in_carpet(int x, int y){
        if (x == 0 || y == 0){
            return true;
        }  else if (x % 3 == 1&& y % 3 == 1){
            return false;
        } else {
            return in_carpet(x/3,y/3);
    }
}

void carpet(int n){
   int i,j,dim;
 
	for (i=0, dim=1; i < n; i++, dim *= 3);

 
	for (i = 0; i < dim; i++) {
		for (j = 0; j < dim; j++) {
			if (in_carpet(i, j)){
                printf("**");
            }  else{
                printf("  ");
            }
		
			
		}
		printf("\n");
	}
}

int main(void){
    carpet(2);
    return 0;
}
