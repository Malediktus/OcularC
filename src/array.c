#include "compiler.h"
#include "helpers/vector.h"
#include <assert.h>

struct array_brackets *array_brackets_new()
{
    struct array_brackets *brackets = calloc(1, sizeof(struct array_brackets));
    brackets->n_brackets = vector_create(sizeof(struct node *));
}