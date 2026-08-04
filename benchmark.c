#include <stdio.h>
int main() {
    long i = 0, toplam = 0;
    while (i < 1000000) {
        toplam += i;
        i++;
    }
    printf("%d\n", toplam);
    return 0;
}
