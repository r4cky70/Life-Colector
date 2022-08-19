



% Conta # funcional
conte([], 0).
conte(['#'|T], N) :- conte(T,N1), N is N1 + 1.
conte([X|T], N) :- X \= '#', conte(T,N). % talvez seja redundante a primiera condicional




checa(Mx, Y, X) :-
    %aux([A, B, C, D, E, F, G, H]),
    nth0(0, Mx, List),
    length(List, Row), 
    Len is Row - 1, 
    
	(X =\= 0, Y =\= 0, length(Mx, K), K =\= X, Y =\= Len),
    
    Xx is X -1, XX is X + 1, Yy is Y - 1, YY is Y + 1,
    
    nth0(Y, Aa, A), nth0(Xx, Mx, Aa),
    nth0(Yy, Bb, B), nth0(X, Mx, Bb),
    nth0(Y, Cc, C), nth0(XX, Mx, Cc),
    nth0(Yy, Dd, D), nth0(X, Mx, Dd),
    nth0(YY, Ee, E), nth0(XX, Mx, Ee),
    nth0(YY, Ff, F), nth0(Xx, Mx, Ff),
    nth0(Yy, Gg, G), nth0(XX, Mx, Gg),
    nth0(Yy, Hh, H), nth0(Xx, Mx, Hh),

    %aux(Aux),
    conte([A, B, C, D, E, F, G, H], LiveNeighbours),
    
    (nth0(Y, Bb, I), I = '#' -> LiveNeighbours >= 2, LiveNeighbours =< 3).



advanceGameState(Mx, _, Y, []) :- length(Mx, Y). % Se manter o método como recebendo dois parâmetros, refatorar todas as suas ocorrências
advanceGameState(Mx, X, Y, [H2|T2]) :- % X e Y começam com 0 (zero).
    advanceGameStateRow(Mx, X, Y, H2), 
    K is Y + 1,
    advanceGameState(Mx, 0, K, T2).
    
advanceGameStateRow(Mx, X, _, []) :- nth0(0, Mx, R), length(R, X).
advanceGameStateRow(Mx, X, Y, [H2|T2]) :- 
    (checa(Mx, X, Y) -> H2 = '#'; H2 = ' '),
    Z is X + 1,
    advanceGameStateRow(Mx, Z, Y, T2).
     