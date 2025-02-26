//
//  name.c
//  swift-c-interop
//
//  Created by Benjamin Seifert on 25.02.25.
//

#include <stdlib.h>
#include <string.h>

char *append_name(const char *name) {
    // Allocate memory for the new string
    size_t len_hello = strlen("Hello ");
    size_t len_name = strlen(name);
    char *result = (char *)malloc((len_hello + len_name + 1) * sizeof(char));

    // Check if memory allocation was successful
    if (result == NULL) {
        return NULL;
    }

    // Copy "Hello " into the allocated memory
    strcpy(result, "Hello ");

    // Concatenate the name to the result
    strcat(result, name);

    return result;
}
