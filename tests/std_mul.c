#include <stdio.h>
#include "bn.h"


int npassed = 0;
int ntests = 0;

void multiplyTest(void) {
    struct bn myTest;
    struct bn multiplier;
    struct bn tmp;
    bignum_from_int(&myTest, 1);
    bignum_from_int(&multiplier, 100);

    for (int i = 0; i < 10; i++) {
        bignum_mul(&myTest, &multiplier, &tmp);
    }
}

int main() {
  printf("\nbignum_mul perf test\n");
  printf("\n");

  for (int i = 0; i < 10000; i++) {
      multiplyTest();
  }
  return 0;
}

