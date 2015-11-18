all : q25_py q25_idl display

q25_py : q25.py
	python q25.py

q25_idl : q25.pro
	$(IDL_DIR)/bin/idl -e "q25"
	rm q25.fits

display : q25.png
	display q25.png



