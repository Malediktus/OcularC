#include <stdio.h>
#include "compiler.h"

int main()
{
    int res = compile_file("example.c", "example", 0);
    if (res == COMPILER_FILE_COMPILED_OK)
        printf("Compiled successfully\n");
    else if (res == COMPILER_FAILED_WITH_ERRORS)
        printf("Compile failed\n");
    else
    {
        printf("Unknown responce");
    }

    return 0;
}