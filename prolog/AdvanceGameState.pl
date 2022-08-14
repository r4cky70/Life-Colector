


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




AdvanceGameState(Mx) :-
    nth0(1, Mx, J),
    length(J, W),
    length(Mx, H).
    %compreensao.
    
    
     