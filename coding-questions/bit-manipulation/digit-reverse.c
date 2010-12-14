#include<stdio.h>

// Here n is the no.of digits
// radix is the base of the digit
// look up table is a optimized table that is of size less that total no.of of inputs by 2.
// size of lookup table = x(x-1) / 2. where x = (radix ^ (n-1))
// so for radix = 4, and n = 2, lookup table size is 6

void swap(int *input, int i , int j) {
	int temp;
	printf("swapping %d and %d\n", i, j);
	temp = input[i];
	input[i] = input[j];
	input[j] = temp;
}

void digit_reverse(int *input, int *lookup, int n, int radix) {
	if(n != 2) return; // For now handling only 2 digits, radix can be any number but lookup table has to be changed.
	int k = 0, z = 0;
	for (int i = 0; i < radix; i++) {
		for(int j = 0; j < radix; j++) {
			if(i < j) {
				swap(input, k, lookup[z]);
				z++;
			}
			k++;
		}
	}
}

int main() {
	int input[16] =  { 1, 3, 4, 5, 2, 6, 8, 4, 9 , 10, 3, 4, 5, 7, 9, 10 };
   int	lookup[6] = {
	   // Look up table for radix 4 and 2 digits.
		/* 0 1 -> 1 0 */ 4,
		/* 0 2 -> 2 0 */ 8,
		/* 0 3 -> 3 0 */ 12,
		/* 1 2 -> 2 1 */ 9,
		/* 1 3 -> 3 1 */ 13,
		/* 2 3 -> 3 2 */ 14
		/* Don't consider cases where first digit is >= the second digit */
   };
	digit_reverse(input, lookup, 2, 4);
	return 0;
}

