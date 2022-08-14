:- Main.
:- Structures.
:- AdvanceGameState.


repete(ListIn, _, 0, ListIn).
repete(ListIn, T, N, ListOut) :- append(ListIn, T, ListTem), repete(ListTem, T, K, ListOut), K is N -1.



matrixGen(Height, Width, Matrix) :-
    repete([], ' ', Width, Row),
    repete([], Row, Height, Matrix).



plotMatrix(Matrix) :-
    repete([], '-', N, Blanks), N is Len + 2, length(Rown, Len), nth0(0, Matrix, Row),

    write(Blanks), nl,
    write(V), V <- {Line, Line is ('|' ++ X ++ '|'), X <- Matrix},
    write(Blanks), nl.



viewMatrix(Matrix) :-
    write('\e[H\e[2J'),
    write('1. Adicionar | q. Sair | [_]. Avançar | SZ: ' ++ Row ++ 'x' ++ Columns), length(Matrix, Row), lenght (Row0, Columns), nth0(0, MAtrix, Row), nl,
    PlotMatrix.



inputPlay(Mx, 1) :-
    write('Selecione a Estrutura para adicionar ao mapa'), nl,
    write(Opc), Opc is (X ++ '. ' ++ Spc),  Ship[Spc|_], nth0(K, spcShip, Ship), K is X -1, X <- {W <- 1..L, length(spcShip, L)},
    read(Id),
    write('linha: '), nl,
    read(Row),
    write('Coluna: '), nl,
    read(Column),
    insertSpaceShip(Mx, Id, Row, Column, Mx2),
    viewMatrix(Mx2),
    read(Input),
    inputPlay(Mx2, Input).

inputPlay(_, 'q') :- main().

inputPlay(Mx, _) :-
    AdvanceGameState(Mx, Mx2),
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