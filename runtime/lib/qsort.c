#include <stdlib.h>

static void swap_elements(unsigned char *a, unsigned char *b, size_t size)
{
    while(size > 0) {
        unsigned char temporary = *a;
        *a++ = *b;
        *b++ = temporary;
        --size;
    }
}

static void sift_down(unsigned char *base, size_t root, size_t end,
                      size_t size,
                      int (*compar)(const void *, const void *))
{
    while(root < end && root <= (end - 1) / 2) {
        size_t child = root * 2 + 1;
        size_t greatest = child;
        unsigned char *root_element = base + root * size;
        unsigned char *child_element = base + child * size;

        if(child < end &&
           compar(child_element, base + (child + 1) * size) < 0)
            greatest = child + 1;
        if(compar(root_element, base + greatest * size) >= 0)
            return;
        swap_elements(root_element, base + greatest * size, size);
        root = greatest;
    }
}

void qsort(void *base, size_t nmemb, size_t size,
           int (*compar)(const void *, const void *))
{
    unsigned char *bytes = (unsigned char *)base;
    size_t i;

    if(nmemb < 2 || size == 0) return;
    for(i = nmemb / 2; i > 0; ) {
        --i;
        sift_down(bytes, i, nmemb - 1, size, compar);
    }
    for(i = nmemb - 1; i > 0; --i) {
        swap_elements(bytes, bytes + i * size, size);
        sift_down(bytes, 0, i - 1, size, compar);
    }
}
