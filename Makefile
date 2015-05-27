
OPTS = -use-ocamlfind -pkgs js_of_ocaml,js_of_ocaml.syntax -syntax camlp4o

PROG = calc
# recall '.byte' to generate byte code and '.native' to generate binary

all :
	ocamlbuild $(OPTS) src/$(PROG).byte

me :
	js_of_ocaml ./$(PROG).byte

clean :
	rm -r _build/ *.byte $(PROG).js
