compiler: lex.yy.c y.tab.c
	gcc -g lex.yy.c y.tab.c -o compiler

lex.yy.c: y.tab.c ./scanner/Scanner.l
	lex ./scanner/Scanner.l

y.tab.c: ./parser/Parser.y
	yacc -d ./parser/Parser.y

clean: 
	rm -rf lex.yy.c y.tab.c y.tab.h compiler compiler.dSYM

