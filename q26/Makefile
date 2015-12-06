all : q26_py q26_idl display

q26_py : q26.py
	python q26.py

q26_idl : q26.pro
	$(IDL_DIR)/bin/idl -e "q26"
	rm q26.fits

display : q26.png
	display q26.png



