#include <stdio.h>
#include <stdlib.h>
#include "compiler.h"

int main()
{
    int res = compile_file("example.oc", "example", 0);
    if (res == COMPILER_FILE_COMPILED_OK)
        printf("\x1B[32mCompiled successfully\x1B[0m\n");
    else if (res == COMPILER_FAILED_WITH_ERRORS)
        printf("\x1B[31mCompile failed\x1B[0m\n");
    else
    {
        printf("\x1B[31mUnknown responce\x1B[0m\n");
    }

    return 0;
}