PICO_TOOLCHAIN_PATH?=/usr/
CPP=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-cpp
CC=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-gcc
AS=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-as

%.i: %.c
	$(CPP) $<.c > $@

%.s: %.i
	$(CC) -S $<.i

%.o: %.s
	$(AS) $<.s -o $@

.PHONY: clean
clean:
	rm -f *.i *.o *.s
