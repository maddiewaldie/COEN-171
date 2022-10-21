/*
Maddie Waldie
COEN 171 - HW 1: Quicksort
*/

# include <stdio.h>
# include <stdlib.h>

#define high 8
typedef int numbers[high];

void readArray(int *a) {
    int i;
    for (i = 0; i < high; i++) {
        scanf("%d", a);
        a++;
    }
}

void writeArray(int a[]) {
	int i;
	for (i = 0; i < high; i++) {
        printf("%d ", a[i]);
    }
	printf("\n");
}

void exchange(int *a, int *b) {
    int t;
    t = *a;
    *a = *b;
    *b = t;
}

int partition(numbers a, int y, int z) {
    int i, j, x;
    x = a[y];
    i = y - 1;
    j = z + 1;

    while(i < j) {
        do {
            j = j - 1;
        } while (a[j] > x);
        do {
            i = i+1;
        } while (a[i] < x);
        if (i < j) {
            exchange(&a[i], &a[j]);
        }
    }
    return j;
}

void quicksort(numbers a, int m, int n){
    int i;
    if (n > m) {
        i = partition(a, m, n);
        quicksort(a, m, i);
        quicksort(a, i + 1, n);
    }
}

int main(int argc, char *argv[]){
    numbers a;
    readArray(a);
    quicksort(a, 0, high - 1);
    writeArray(a);
}