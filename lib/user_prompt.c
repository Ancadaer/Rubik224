#include <stdio.h>
#include <stdlib.h>

int main () {
    FILE *comandos;
    comandos = fopen("./comandos.txt", "w+");
    char *line = NULL;
    printf(">>Enter your command\n");
    size_t size;
    line = malloc(1024);
    getline(&line, &size, stdin);
    fprintf(comandos, "%s", line);
    fclose(comandos);
    printf("%s", line);
}
