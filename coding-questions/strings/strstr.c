#include<stdio.h>
#include<string.h>
/****
2 strings.
String1 = “Hello”
String2 = “ell”
Return pointer to 'e'.
*****/

char *strstr1(char *str1, char *str2) {
	int i;
	if(!*str1 || !*str2)
		return NULL;
	for(i = 0; i < strlen(str2); i++)
		if(str1[i] != str2[i])
			break;
	if(!str2[i]) /* we reached the end of str2 so we have a match */
		return str1;
	else
		return strstr1(++str1, str2);
}

void main() {
	char *temp;

	// Test Cases
	printf("%s\n", 	strstr1("helloworld", "owo"));

	temp = strstr1("owo", "owo");
	printf("%s\n", 	temp == NULL ? "no match" : temp);

	temp = strstr1("owo", "owox");
	printf("%s\n", 	temp == NULL ? "no match" : temp);

	temp = strstr1("", "owo");
	printf("%s\n", 	temp == NULL ? "no m" : temp);

	temp = strstr1("xxxxxxxxxxxx", "");
	printf("%s\n", 	temp == NULL ? "no m" : temp);

	temp = strstr1("abbaxyz", "bba");	/* I got fucked for this usecase at MS */
	printf("%s\n", 	temp == NULL ? "no m" : temp);
	return;
}




