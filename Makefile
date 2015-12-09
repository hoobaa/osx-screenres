CFLAGS=-framework ApplicationServices
OBJ=screenres
SRC=$(OBJ).swift

test : $(OBJ)
	./$(OBJ)

$(OBJ): $(SRC)
	xcrun --sdk macosx swiftc $<

clean: $(OBJ)
	rm $<

install: $(OBJ)
	cp -p $< ~/usr/local/bin

.PHONY: test clean install

# .DEFAULT: echo
