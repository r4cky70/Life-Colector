:-[structures].
:-[game].


mainGame() :- 
    write('\e[H\e[2J'),
    writeln('----------------------------- Jogo da Vida -----------------------------'),
    writeln('Digite 1 para jogar'),
    writeln('Digite 2 para jogar com tabuleiro personalizado'),
    writeln('Digite 3 para visualizar as estruturas'),
    writeln('Digite 0 para sair'),

    read(O),
    write('\e[H\e[2J'),
    executaOpcao(O).



% Executa a opção escolhida        com ponto no final
executaOpcao(1) :- iniciaJogo(35, 208).
executaOpcao(2) :- preparaJogo().
executaOpcao(3) :- escolheEstrutura().
executaOpcao(0) :-
                nl, writeln('Até uma próxima jogatina :)').
executaOpcao(_) :-
                nl, write('Opção inválida :('), nl,
                writeln('Pressione um <Enter> para voltar ao Menu'),  %% Por hora, um caractere com ponto e enter
                read(_),
                write('\e[H\e[2J'),
                mainGame().



% Lista o nome das estruturas presentes.
escolheEstrutura() :-
    write('\e[H\e[2J'),
    writeln('Selecione uma estrutura para visualizar'), nl, 
    menuEstruturas(0),
    % write(0), 
    nl, writeln('Pressione 0 para voltar ao menu'),
    read(E),
    write('\e[H\e[2J'),
    mostraEstrutura(E).
    % write(E).



menuEstruturas(N) :-
    spcShips(Ships),
    length(Ships, K),
    N is K -1, 
    getShip(N, [Name, _]),
    number_string(K, Ns),
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



mostraEstrutura(0) :- mainGame().
mostraEstrutura(E) :- 
    getShip(Id, [_, Spc]),
    spcShips(Ships),
    E > 0, 
    length(Ships, L), 
    E =< L,
    Id is E - 1,
    plotMatrix(Spc),    
    write('Pressione um <Enter> para escolher outra estrutura'), nl,     %% Por hora, um caractere com ponto e enter
    read(_),
    escolheEstrutura().
mostraEstrutura(_) :- 
    nl, write('Opção inválida :('), nl,
    write('Pressione um <Enter> para voltar ao Menu'), nl,  %% Por hora, um caractere com ponto e enter
    read(_),
    write('\e[H\e[2J'),
    escolheEstrutura().