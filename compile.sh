#!/bin/bash

ocamllex lex.mll && \
	ocamlyacc parser.mly && \
	ocamlc -c parser.mli && \
	ocamlc -c lex.ml && \
	ocamlc -c parser.ml && \
	ocamlc -c impterpreter.ml && \
	ocamlc -o impterpreter lex.cmo parser.cmo impterpreter.cmo
