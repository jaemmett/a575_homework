all : q18_idl q18_f q18_py q18_c

q18_idl : q18.pro
	$(IDL_DIR)/bin/idl -e "q18"

q18_f : q18.f90
	ifort -o q18 q18.f90
	q18

q18_py : q18.py
	python q18.py

q18_c : q18.c
	cc -o q18 q18.c
	q18
