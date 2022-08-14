


% Lista de estruturas especiais.
spcShip(
    [
    ['Glider - cells=5', ['#  ', ' ##', '## ']],
    ['Lightwight Spaceship - cells=9', ['  ## ', '## ##', '#### ', ' ##  ']],
    ['Tsunami - cells=25', ['       ## #     ', '    ## # ## ### ', ' ####  ##      #', '#    #   #   ## ', ' ##             ']],
    ['Loafer - cells=20', [' ###  # #', '#  ## # #', ' # ##  # ', '  #      ', '        #', '      ###', '     #  #', '      ## ', '      ## ']],
    ['Copper head - cells=28', ['  ####  ', '  #  #  ', ' ###### ', '        ', '        ', '#  ##  #', '# #### #', '# #  # #', '        ', '        ', '   ##   ', '   ##   ']],
    ['Weekender - cells=36', [' #            # ', ' #            # ', '# #          # #', ' #            # ', ' #            # ', '  #   ####   #  ', '      ####      ', '  ####    ####  ', '                ', '    #      #    ', '     ##  ##     ']],
    ['Special Spaceship', 
    ['### #  # ### #### ### ### #  #',
    '#   #  # #   #  #  #  # # ## #',
    '### #  # ### ####  #  # # # ##',
    '#   #  # #   ##    #  # # #  #',
    '###  ##  ### #  #  #  ### #  #']]
    ]
    ).



% Função que insere uma estrutura especial em uma determinada coordenada do tabuleiro.
insertSpaceShip(Mx, Id, Height, Width, R) :- 
    Indice is Id -1,
    spcShip(ShipList),
    nth0(Indice, ShipList, SpcShipDesc),
    last(SpcShipDesc, Ship),

    (Id > 0, lenght(SpcShipDesc, L) Id =< L, Width >= 0, Height >= 0 ->
        R <- {[S2] & nth0(I2, S1, S2), I2 is (X - Width), nth0(I1, Ship, S1), I1 is (Y - Height), Y <- 0..Ms1, Ms1 is Ms -1, length(Mx, Ms) })




% Compreensao de listas

% We need operators
:- op(700, xfx, <-).
:- op(450, xfx, ..).
:- op(1100, yfx, &).
 
% use for explicit list usage
my_bind(V, [H|_]) :- V = H.
my_bind(V, [_|T]) :- my_bind(V, T).
 
% we need to define the intervals of numbers
Vs <- M..N :-
        integer(M),
	integer(N),
	M =< N,
	between(M, N, Vs).
 
% for explicit list comprehension like Vs <- [1,2,3]
Vs <- Xs :-
	is_list(Xs),
	my_bind(Vs, Xs).
 
% finally we define list comprehension
% prototype is Vs <- {Var, Dec, Pred} where
% Var is the list of variables to output
% Dec is the list of intervals of the variables
% Pred is the list of predicates
Vs <- {Var & Dec & Pred} :-
	findall(Var,  maplist(call, [Dec, Pred]), Vs).
 
% for list comprehension without Pred
Vs <- {Var & Dec} :-
	findall(Var, maplist(call, [Dec]), Vs).
