CC     := gcc
MACROS := 
CFLAGS := -I. -Wundef -Wall -Wextra -O3 -mtune=native $(MACROS)

all: bn.o tests_golden tests_hand_picked  tests_mul_perf tests_mul_std #tests_load_cmp tests_rsa

bn.o: bn.c bn.h
	@$(CC) -c $(CFLAGS) bn.c

tests_golden: tests/golden.c  bn.o
	@$(CC)  $(CFLAGS) bn.o tests/golden.c -o ./build/test_golden

tests_hand_picked: tests/hand_picked.c bn.o
	@$(CC)  $(CFLAGS) bn.o tests/hand_picked.c -o ./build/test_hand_picked



########################################################################
##### Performance tests
########################################################################
tests_mul_perf: tests/mul_perf.c bn.o
	@$(CC)  $(CFLAGS) bn.o tests/mul_perf.c -o ./build/test_mul_perf

tests_mul_std: tests/std_mul.c bn.o
	@$(CC)  $(CFLAGS) bn.o tests/std_mul.c -o ./build/test_std_mul


test: all
	@echo
	@echo ================================================================================
	@./build/test_golden
	@echo ================================================================================
	@./build/test_hand_picked

clean:
	@rm -f ./build/*
	@rm bn.o


