CFLAGS=-framework ApplicationServices
OBJ=screenres
SRC=$(OBJ).m

test : $(OBJ)
	./$(OBJ)

$(OBJ): $(SRC)

clean: $(OBJ)
	rm $<

install: $(OBJ)
	cp -p $< ~/usr/local/bin

.PHONY: test clean install

# .DEFAULT: echo
