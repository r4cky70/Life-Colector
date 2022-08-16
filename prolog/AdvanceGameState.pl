


count([],0).
count(['#'|T],N) :- count(T,N1), N is N1 + 1.
count([X|T],N) :- X \= '#', count(T,N). % talvez seja redundante a primiera condicional




checa(Mx, Y, X) :-
    Aux is [A, B, C, D, E, F, G, H],
    nth0(Y, Aa, A), nth0(Xx, Mx, Aa),
    nth0(Yy, Bb, B), nth0(X, Mx, Bb),
    nth0(Y, Cc, C), nth0(XX, Mx, Cc),
    nth0(Yy, Dd, D), nth0(X, Mx, Dd),
    nth0(YY, Ee, E), nth0(XX, Mx, Ee),
    nth0(YY, Ff, F), nth0(Xx, Mx, Ff),
    nth0(Yy, Gg, G), nth0(XX, Mx, Gg),
    nth0(Yy, Hh, H), nth0(Xx, Mx, Hh),

    Xx is X -1, XX is X + 1, Yy is Y - 1, YY is Y + 1,
    count(Aux, LiveNeighbours),

    Len is Row - 1, length(List, Row), nth0(0, Mx, List),
    ((X =\= 0, Y =\= 0, length(Mx, K), K =\= X, Y =\= Len);
    ((nth0(Y, Bb, I), I =:= '#') -> (LiveNeighbours >= 2, LiveNeighbours =< 3));
    (LiveNeighbours =:= 3)).



AdvanceGameState(_, [], _, _). % Se manter o método como recebendo dois parâmetros, refatorar todas as suas ocorrências
AdvanceGameState(Mx, [L2|T2], X, Y) :- % X e Y começam com 0 (zero).
    AdvanceGameStateRow(L1, L2, X, Y), AdvanceGameState(T1, T2, 0, K), K is Y + 1.
    
AdvanceGameStateRow(_, [], X, Y).
AdvanceGameStateRow(Mx, [E2|L2], X, Y) :- 
    (checa(Mx, X, Y) -> E2 is '#'; E2 is ' '), AdvanceGameStateRow(Mx, L2, Z, Y), Z is X + 1.
     