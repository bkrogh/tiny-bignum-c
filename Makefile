CC     := gcc
MACROS := 
CFLAGS := -I. -Wundef -Wall -Wextra -O3 -mtune=native $(MACROS)

all: bn.o tests_factorial tests_golden tests_hand_picked  tests_randomized  tests_mul_perf tests_mul_std #tests_load_cmp tests_rsa

bn.o: bn.c bn.h
	@$(CC) -c $(CFLAGS) bn.c

tests_factorial: tests/factorial.c bn.o
	@$(CC)  $(CFLAGS) bn.o tests/factorial.c -o ./build/test_factorial

tests_golden: tests/golden.c  bn.o
	@$(CC)  $(CFLAGS) bn.o tests/golden.c -o ./build/test_golden

tests_hand_picked: tests/hand_picked.c bn.o
	@$(CC)  $(CFLAGS) bn.o tests/hand_picked.c -o ./build/test_hand_picked

#tests_load_cmp: tests/load_cmp.c bn.o
#	@$(CC)  $(CFLAGS) bn.o tests/load_cmp.c  -o ./build/test_load_cmp

tests_randomized: tests/randomized.c bn.o
	@$(CC)  $(CFLAGS) bn.o tests/randomized.c -o ./build/test_random

tests_rsa: tests/rsa.c bn.o
	@$(CC)  $(CFLAGS) bn.o tests/rsa.c -o ./build/test_rsa

tests_mul_perf: tests/mul_perf.c bn.o
	@$(CC)  $(CFLAGS) bn.o tests/mul_perf.c -o ./build/test_mul_perf

tests_mul_std: tests/std_mul.c bn.o
	@$(CC)  $(CFLAGS) bn.o tests/std_mul.c -o ./build/test_std_mul


test:
	@echo
	@echo ================================================================================
	@./build/test_golden
	@echo ================================================================================
	@./build/test_hand_picked
	@echo ================================================================================
	@./build/test_load_cmp
	@echo ================================================================================
	@python ./scripts/fact100.py
	@./build/test_factorial
	@echo ================================================================================
	@python ./scripts/test_old_errors.py
	@echo ================================================================================
	@#./build/test_rsa
	@#echo ================================================================================
	@python ./scripts/test_rand.py 1000
	@echo ================================================================================
	@echo

clean:
	@rm -f ./build/*
	@rm bn.o


