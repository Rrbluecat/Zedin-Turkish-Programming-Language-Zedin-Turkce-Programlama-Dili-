#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Zedin runtime yardımcı fonksiyonları
long hata_mi(long val) {
    return val == 0 ? 1 : 0;
}

long tamam_mi(long val) {
    return val != 0 ? 1 : 0;
}

char* deger_al(long val) {
    return (char*)val;
}

char* ortam_degiskeni(const char* ad) {
    char* env = getenv(ad);
    return env ? env : "";
}

char* komut_calistir(const char* komut) {
    FILE* fp = popen(komut, "r");
    if (!fp) return "";
    
    static char tampon[4096];
    size_t bytes = fread(tampon, 1, sizeof(tampon) - 1, fp);
    tampon[bytes] = '\0';
    pclose(fp);
    
    return tampon;
}
