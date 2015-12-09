CFLAGS=-framework ApplicationServices

test : setgetscreenres
	./setgetscreenres

setgetscreenres: setgetscreenres.m
# 	cc -o $@ -framework ApplicationServices $<

clean: setgetscreenres
	rm $<

install: setgetscreenres
	cp -p $< ~/usr/local/bin

.PHONY: test clean install

# .DEFAULT: echo
