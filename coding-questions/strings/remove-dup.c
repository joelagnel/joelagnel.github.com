#include<stdio.h>
/****
2 strings.
String1 = “Hello”
String2 = “eo”
How to check the duplicate characters from string2 in string1 and
then remove it?
*****/

int main() {
	char input[] = { "Hello" };
	char dup_table[128] = {};
	char *sub = "eo";
	char *cur = input;
	char *end = input;
	/* Build hashtable of duplicates */
	cur = sub;
	while(*cur) {
		dup_table[*cur] = 1;
		cur++;
	}
	/* Remove duplicates from string */
	cur = input;
	while(*cur) {
		if(!dup_table[*cur]) {
			*end = *cur;
			end++;
		}
		cur++;
	}
	*end = '\0';
	// Print
	printf("input = %s\n", input);
	return 0;
}
