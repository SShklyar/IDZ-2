#include <stdio.h>
#include <string.h>
char Max(char max, char s1[]){
    for(int i = 0; i < strlen(s1) - 1; i++)
    {
        if(max < s1[i]) max = s1[i];
    }
        return max;
}
char Min(char min, char s1[]){
    for(int i = 0; i < strlen(s1) - 1; i++)
    {
        if(min > s1[i]) min = s1[i];
    }
    return min;
}
int main()
{
    char s1[10000];
    fgets(s1, sizeof (s1) + 1, stdin);
    char max = 0, min = 127;

    max = Max(max, s1);
    min = Min(min, s1);

    printf("%c\n", min);
    printf("%c\n", max);
    return 0;
}
