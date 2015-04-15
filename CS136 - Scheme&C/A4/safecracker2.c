#include <stdbool.h>
#include "paranoid_safe.h"

extern int unlock(code) = true;

void get_money(void){
    const int d = count_money();
    printf("%d", d);
}
