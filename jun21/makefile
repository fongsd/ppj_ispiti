izvrsni: parser.o lexer.o
	g++ -Wall -o $@ $^
	
lexer.o: lex.yy.c parser.tab.hpp
	g++ -Wall -c -o $@ $<

lex.yy.c: lexer.lex
	flex $<

parser.o: parser.tab.cpp parser.tab.hpp
	g++ -Wall -c -o $@ $<
	
parser.tab.cpp parser.tab.hpp: parser.ypp
	bison -d -v $<

.PHONY: clean
	
clean: 
	rm -f *.hpp *.output *.cpp izvrsni *.o *.c
