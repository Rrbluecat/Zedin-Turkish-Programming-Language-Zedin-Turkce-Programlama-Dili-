#include "Bytecode.h"
int main() {
    auto chunk = BChunk::yukleDosya("test_simple.zedc");
    chunk->disassemble();
    return 0;
}
