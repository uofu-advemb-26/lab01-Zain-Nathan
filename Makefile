PICO_TOOLCHAIN_PATH?=/usr/
CPP=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-cpp
CC=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-gcc
AS=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-as
LD=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-ld
SRC=main.c
OBJS=$(patsubst %.c,%.o,$(SRC))

.PHONY: clean all

all: firmware.elf

%.i: %.c
	$(CPP) $<.c > $@

%.s: %.i
	$(CC) -S $<.i

%.o: %.s
	$(AS) $<.s -o $@

firmware.elf: $(OBJS)
	$(LD) -o $@ $^

hello.txt:
    echo "hello world!" > hello.txt

clean:
	rm -f *.i *.o *.s *.elf
