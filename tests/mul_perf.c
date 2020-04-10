#include <stdio.h>
#include "bn.h"


int npassed = 0;
int ntests = 0;

void multiplyTest(void) {
    struct bn myTest;
    for (int i = 0; i < 10; i++) {
        bignum_from_int(&myTest, 1);
        bignum_mul_int(&myTest, 100);
    }
}

int main() {
  printf("\n%d/%d tests successful.\n", npassed, ntests);
  printf("\n");

  for (int i = 0; i < 4000000; i++) {
      multiplyTest();
  }
  return 0;
}

