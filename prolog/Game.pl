% :- [main].
:- [structures].
:- [advanceGameState].


% Função que gera repetição de termos e listas.
repete(0, _, []).
repete(Cont, Elem, [Elem|T]) :- NewCont is Cont-1, repete(NewCont, Elem, T).



% Função que gera a matriz inicial. 
matrixGen(Height, Width, Matrix) :-
    repete(Width, ' ', Row),
    repete(Height, Row, Matrix).



% Função que formata o tabuleiro.
plotMatrix(Matrix) :-
    nth0(0, Matrix, Row),
    length(Row, Len), 
    N is Len + 2,
    repete(N, '-', List),
    atomic_list_concat(List, Blanks),  

    writeln(Blanks),
    linhas(Matrix, 0),
    write(Blanks), nl.



% Função que ajuda na formatação do tabuleiro formatando as linhas.
linhas(X, N) :-
    length(X, K),
    N =:= K -1, 
    nth0(N, X, Row),
    append(['|'], Row, Pre),
    append(Pre, ['|'], List),
    atomic_list_concat(List, Line),
    writeln(Line). 

linhas(X, I) :-
    nth0(I, X, Row),
    J is I + 1,
    append(['|'], Row, Pre),
    append(Pre, ['|'], List),
    atomic_list_concat(List, Line), 
    writeln(Line),
    linhas(X, J).



% Função que mostra o tabuleiro.
viewMatrix(Matrix) :-
    write('\e[H\e[2J'),
    
    nth0(0, Matrix, Row0),
    length(Row0, Columns),
    length(Matrix, Row),
    atom_concat(Row, 'x', Pre),
    atom_concat(Pre, Columns, Pos),
    atom_concat('1. Adicionar | q. Sair | [_]. Avançar | SZ: ', Pos, Head),
    writeln(Head),  
    plotMatrix(Matrix).



% inputPlay(Mx, 1) :-
%     write('Selecione a Estrutura para adicionar ao mapa'), nl,
%     write(Opc), Opc is (X ++ '. ' ++ Spc),  Ship[Spc|_], nth0(K, spcShip, Ship), K is X -1, X <- {W <- 1..L, length(spcShip, L)},
%     read(Id),
%     write('linha: '), nl,
%     read(Row),
%     write('Coluna: '), nl,
%     read(Column),
%     insertSpaceShip(Mx, Id, Row, Column, Mx2),
%     viewMatrix(Mx2),
%     read(Input),
%     inputPlay(Mx2, Input).

inputPlay(_, 'q') :- main().

inputPlay(Mx, _) :-
    advanceGameState(Mx, Mx2),
    viewMatrix(Mx2),
    read(Input),
    inputPlay(Mx2, Input).



game(W, H) :-
    matrixGen(W, H, Matrix),
    viewMatrix(Matrix),
    inputPlay(Move),
    inputPlay(Matrix, Move).



iniciaJogo(L, C) :-
    matrixGen(L, C, Matrix),
    viewMatrix(Matrix),
    read(Move),
    inputPlay(Matrix, Move).