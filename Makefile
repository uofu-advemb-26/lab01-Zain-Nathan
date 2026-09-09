PICO_TOOLCHAIN_PATH?=/usr/
CPP=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-cpp

main.i: main.c
	$(CPP) main.c > main.i

.PHONY: clean
clean:
	rm -f main.i hello.txt
