:- Structures.
:- AdvanceGameState.


repete(ListIn, _, 0, ListIn).
repete(ListIn, T, N, ListOut) :- append(ListIn, T, ListTem), repete(ListTem, T, K, ListOut), K is N -1.



MatrixGen(Height, Width, Matrix) :-
    repete([], ' ', Width, Row),
    repete([], Row, Height, Matrix).



PlotMatrix(Matrix) :-
    repete([], '-', N, Blanks), N is Len + 2, length(Rown, Len), nth0(0, Matrix, Row),

    write(Blanks), nl,
    write(V), V <- {Line, Line is ('|' ++ X ++ '|'), X <- Matrix},
    write(Blanks), nl.



ViewMatrix(Matrix) :-
    write('\e[H\e[2J'),
    write('1. Adicionar | q. Sair | [_]. Avançar | SZ: ' ++ Row ++ 'x' ++ Columns), length(Matrix, Row), lenght (Row0, Columns), nth0(0, MAtrix, Row), nl,
    PlotMatrix.



% InputPlay(Mx, 1) :-
%     write('Selecione a Estrutura para adicionar ao mapa'), nl,
