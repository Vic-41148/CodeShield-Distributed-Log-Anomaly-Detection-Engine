CC = gcc
CFLAGS = -Wall -Wextra -O2 -pthread -g
TARGET = codeshield
OBJS = main.o ingestion.o window.o hashmap.o alert.o scorer.o analyzer.o

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJS)

main.o: main.c structures.h
	$(CC) $(CFLAGS) -c main.c

ingestion.o: ingestion.c structures.h
	$(CC) $(CFLAGS) -c ingestion.c

analyzer.o: analyzer.c structures.h
	$(CC) $(CFLAGS) -c analyzer.c

window.o: window.c structures.h
	$(CC) $(CFLAGS) -c window.c

hashmap.o: hashmap.c structures.h
	$(CC) $(CFLAGS) -c hashmap.c

alert.o: alert.c structures.h
	$(CC) $(CFLAGS) -c alert.c

scorer.o: scorer.c structures.h
	$(CC) $(CFLAGS) -c scorer.c

clean:
	rm -f $(OBJS) $(TARGET)

run: $(TARGET)
	./$(TARGET)

.PHONY: all clean run