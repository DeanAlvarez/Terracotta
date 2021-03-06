MODULES=main command cryptography
OBJECTS=$(MODULES:=.cmo)
MLS=$(MODULES:=.ml)
MLIS=$(MODULES:=.mli)
TEST=test.byte
MAIN=main.byte
OCAMLBUILD=ocamlbuild -use-ocamlfind
PKGS=ounit2,str,ANSITerminal

default: build
	utop

build:
	$(OCAMLBUILD) $(OBJECTS)

test:
	$(OCAMLBUILD) -tag 'debug' $(TEST) && ./$(TEST)

app:
	$(OCAMLBUILD) $(MAIN) && ./$(MAIN)
	
clean:
	ocamlbuild -clean
	rm -rf doc.public doc.private