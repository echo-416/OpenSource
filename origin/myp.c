//Bahasa program oleh afif dengan sedikit bantuan chatgpt heheh
//ver 0.3
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

#define MAX_BLOCKS 10
#define MAX_LINES 50
#define MAX_LEN 100

char text[100];

struct Block {
    char name[50];
    char lines[MAX_LINES][MAX_LEN];
    int count;
};

struct Block blocks[MAX_BLOCKS];
int block_total = 0;

int cari_blok(const char *nama);

void jalankan_baris(char *line);   // interpreter asas
void jalankan_blok(int idx);       // run block

int main(int argc, char *argv[]) {

    if (argc < 2) {
        printf("Cara guna: %s <fail>\n", argv[0]);
        return 1;
    }

    FILE *f = fopen(argv[1], "r");
    if (!f) {
        printf("Tak dapat buka fail.\n");
        return 1;
    }

    int dalam_blok = 0;
    struct Block *b = NULL;

    while (fgets(text, sizeof(text), f)) {

        // buang newline
        text[strcspn(text, "\n")] = 0;

        // tamat blok
        if (strcmp(text, "}") == 0) {
            dalam_blok = 0;
            b = NULL;
            continue;
        }

        // mula blok: .nama {
        if (strstr(text, "{")) {
            dalam_blok = 1;

            sscanf(text, ".%s", blocks[block_total].name);
            blocks[block_total].count = 0;

            b = &blocks[block_total];
            block_total++;

            continue;
        }

        // jika dalam blok → SIMPAN sahaja, jangan execute
        if (dalam_blok) {
            strcpy(b->lines[b->count++], text);
            continue;
        }

        // luar blok → interpret secara normal
        jalankan_baris(text);
    }

    fclose(f);
    return 0;
}

void jalankan_baris(char *line) {

    // panggil .nama
    if (strstr(line, "panggil")) {
        char nama[50];
        sscanf(line, "panggil .%s", nama);

        int idx = cari_blok(nama);
        if (idx >= 0)
            jalankan_blok(idx);
        return;
    }

    // cetak arahan
    if (strstr(line, "cetak")) {
        char *p = strchr(line, ' ');
        if (!p) return;

        p++;
        char *t = strchr(p, '.');
        if (t) *t = 0;

        printf("%s\n", p);
        return;
    }
    if (strstr(line, "puncakuasadua")) {
	    char *p = strchr(line, ' ');
	    if (!p) return;

	    p++;
	    char *t = strchr(p, '.');
	    if (t) *t = 0;

	    double nilai = atof(p);
	    double hasil = sqrt(nilai);

	    printf("%g\n", hasil);
	    return;
    }
}

int cari_blok(const char *nama) {
    for (int i = 0; i < block_total; i++) {
        if (strcmp(blocks[i].name, nama) == 0)
            return i;
    }
    return -1;
}

void jalankan_blok(int idx) {
    for (int i = 0; i < blocks[idx].count; i++)
        jalankan_baris(blocks[idx].lines[i]);
}



