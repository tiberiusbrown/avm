/* Account separately for the application's input and format literal RAM. */
int _start(char *index) {
    const volatile char *text = "123", *format = "%d";
    return text[(unsigned char)index[0] % 4] + format[(unsigned char)index[1] % 3];
}
