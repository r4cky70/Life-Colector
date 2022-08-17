:-[structures].
:-[game].




% Função que exibe o menu
mainGame() :- 
    write('\e[H\e[2J'),
    write('----------------------------- Jogo da Vida -----------------------------'), nl,
    write('Digite 1 para jogar'), nl,
    write('Digite 2 para jogar com tabuleiro personalizado'), nl,
    write('Digite 3 para visualizar as estruturas'), nl,
    write('Digite 0 para sair'), nl,

    read(O),
    write('\e[H\e[2J'),
    executaOpcao(O).



% Executa a opção escolhida        com ponto no final
executaOpcao(1) :- iniciaJogo(35, 208).
executaOpcao(2) :- preparaJogo().
executaOpcao(3) :- escolheEstrutura().
executaOpcao(0) :-
                nl, write('Até uma próxima jogatina :)'), nl.
executaOpcao(_) :-
                nl, write('Opção inválida :('), nl,
                write('Pressione um <Enter> para voltar ao Menu'), nl,  %% Por hora, um caractere com ponto e enter
                read(_),
                write('\e[H\e[2J'),
                mainGame().



% Recebe as proporções do tabuleiro definidas pelo jogador.
preparaJogo() :-
    write('Escolha o tamanho do seu tabuleiro'), nl,
    write('Insira o número de linhas'), nl,
    read(L), nl,
    write('Insira o número de colunas'), nl,
    read(C),
    iniciaJogo(L, C).



% Lista o nome das estruturas presentes.
escolheEstrutura() :-
    write('\e[H\e[2J'),
    write('Selecione uma estrutura para visualizar'), nl,

    % X <- {W <- 1..L, length(spcShip, L)},
    % K is X -1,
    % nth0(K, spcShip, [Spc|_]),
    % Opc is (X ++ '. ' ++ Spc),
    % write(Opc), nl, 
    menuEstruturas(0), 
    write('Pressione 0 para voltar ao menu'), nl,
    read(E),
    write('\e[H\e[2J'),
    mostraEstrutura(E).


menuEstruturas(N) :-
    length(spcShip, K),
    N is K -1, 
    getShip(N, [Name, _]),
    number_string(N, Ns),
    string_concat(Ns, ". ", Pre),
    string_concat(Pre, Name, Op), 
    write(Op), nl. 
menuEstruturas(I) :-
    getShip(I, [Name, _]),
    J is I + 1,
    number_string(J, Js),
    string_concat(Js, ". ", Pre),
    string_concat(Pre, Name, Op), 
    write(Op), nl,
    menuEstruturas(J).
    



% Mostra a estrutura escolhida em escolheEstrutura
mostraEstrutura(0) :- mainGame().
mostraEstrutura(E) :- E > 0, length(spcShip, L), E =< L,
    Mx is spcShip,
    % plotMatrix ()
    plotMatrix(Ship), last(Op, Ship), nth0(K, Mx, Op), K is E - 1,    
    write('Pressione um <Enter> para escolher outra estrutura'), nl,     %% Por hora, um caractere com ponto e enter
    read(_),
    escolheEstrutura().
mostraEstrutura(_) :- 
    nl, write('Opção inválida :('), nl,
    write('Pressione um <Enter> para voltar ao Menu'), nl,  %% Por hora, um caractere com ponto e enter
    read(_),
    write('\e[H\e[2J'),
    escolheEstrutura().