#include <stdlib.h>

void *bsearch(const void *key, const void *base, size_t nmemb, size_t size,
              int (*compar)(const void *, const void *))
{
    const unsigned char *bytes = (const unsigned char *)base;
    size_t low = 0;
    size_t high = nmemb;

    if(nmemb == 0 || size == 0) return NULL;
    while(low < high) {
        size_t mid = low + (high - low) / 2;
        const unsigned char *element = bytes + mid * size;
        int result = compar(key, element);
        if(result < 0)
            high = mid;
        else if(result > 0)
            low = mid + 1;
        else
            return (void *)element;
    }
    return NULL;
}
