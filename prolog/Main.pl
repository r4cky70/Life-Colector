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
executaOpcao(1) :- iniciaJogo(8, 50). %35, 208
executaOpcao(2) :- preparaJogo().
executaOpcao(3) :- escolheEstrutura().
executaOpcao(0) :-
                sai().
executaOpcao(_) :-
                nl, write('Opção inválida :('), nl,
                writeln('Pressione um <Enter> para voltar ao Menu'),  %% Por hora, um caractere com ponto e enter
                read(_),
                write('\e[H\e[2J'),
                mainGame().



preparaJogo() :- 
    writeln('Escolha o tamanho do seu tabuleiro'),
    writeln('Insira o número de linhas'),
    read(R), nl,
    writeln('Insira o número de colunas'),
    read(C),
    iniciaJogo(R, C).
    



% Lista o nome das estruturas presentes.
escolheEstrutura() :-
    write('\e[H\e[2J'),
    writeln('Selecione uma estrutura para visualizar'), nl, 
    menuEstruturas(0), nl,
    writeln('Pressione 0 para voltar ao menu'),
    read(E),
    write('\e[H\e[2J'),
    mostraEstrutura(E).



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
    nl, writeln('Opção inválida :('),
    writeln('Pressione um <Enter> para voltar ao Menu'),  %% Por hora, um caractere com ponto e enter
    read(_),
    write('\e[H\e[2J'),
    escolheEstrutura().



% Função para sair do jogo.
sai() :-
    nl, writeln('Até uma próxima jogatina :)').