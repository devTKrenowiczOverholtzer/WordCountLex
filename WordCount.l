%{
int char = 0;
int words = 0;
int lines = 0;
%}

%% 
[a=zA-Z]+ { words++; chars += strlen(yytext); }
[^ \t\n\r\f\v]+ {words++; chars += strlen(yytext); //wc program word definition: string of nonwhitespace characters}
\n { chars++; lines++; }
. { chars++; }
%%

main(int argc, char **argv){
  yylex();
  printf("%8d%8d%8d\n", lines, words, chars);
//flex <filename>
//cc lex.yy.c
//./a.out
}
