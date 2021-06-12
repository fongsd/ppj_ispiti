izvrsni: lex.yy.o parser.o
		g++ -Wall -o $@ $^

lex.yy.o: lex.yy.c parser.tab.hpp
		g++ -Wall -c -o $@ $<

lex.yy.c: lexer.lex	
	flex -i lexer.lex

parser.o: parser.tab.cpp parser.tab.hpp	
	g++ -Wall -c -o $@ $<

parser.tab.cpp parser.tab.hpp: parser.ypp
	bison -d -v $<

.PHONY: clean

clean:
	rm -f izvrsni *.o lex.yy.c *.cpp *.hpp 