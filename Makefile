LIBS=-lpcre -lcrypto -lm -lpthread
CFLAGS=-ggdb -O3 -Wall
OBJS=satoshiminer.o oclvanityminer keyconv.o

PLATFORM=$(shell uname -s)
ifeq ($(PLATFORM),Darwin)
OPENCL_LIBS=-framework OpenCL
else
OPENCL_LIBS=-lOpenCL
endif


most: miner

all: $(PROGS)

miner: satoshiminer.o oclengine.o pattern.o util.o
	$(CC) $^ -o $@ $(CFLAGS) $(LIBS) $(OPENCL_LIBS) -lcurl
	
clean:
	rm -f $(OBJS) $(PROGS) $(TESTS)
