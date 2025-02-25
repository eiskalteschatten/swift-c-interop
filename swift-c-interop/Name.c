//
//  Name.c
//  swift-c-interop
//
//  Created by Benjamin Seifert on 25.02.25.
//

#include <string.h>

char* append_name(char *name) {
    char *hello = "Hello ";
    strcat(hello, name);
    return hello;
}
