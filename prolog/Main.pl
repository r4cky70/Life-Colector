:-[structures].




% Função que exibe o menu
main :- 
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
executaOpcao(1) :- write('Inicia o jogo'), nl. %% iniciaJogo(35, 208).  A implementar.
executaOpcao(2) :- preparaJogo().
executaOpcao(3) :- escolheEstrutura().
executaOpcao(0) :-
                nl, write('Até uma próxima jogatina :)'), nl, hal.
executaOpcao(_) :-
                nl, write('Opção inválida :('), nl,
                write('Pressione um <Enter> para voltar ao Menu'), nl,  %% Por hora, um caractere com ponto e enter
                read(_),
                write('\e[H\e[2J'),
                main().



% Recebe as proporções do tabuleiro definidas pelo jogador.
preparaJogo() :-
    write('Escolha o tamanho do seu tabuleiro'), nl,
    read(L), nl,
    write('Insira o número de colunas'), nl,
    read(C),
    nl, write('Inicia o jogo com dimensões: '), write(L), write(' X '), write(C), nl.



% Lista o nome das estruturas presentes.
escolheEstrutura :-
    write('\e[H\e[2J'),
    write('Selecione uma estrutura para visualizar'), nl,
    write('listagens das estruturas'), nl, %% A implementar
    write('Pressione 0 para voltar ao menu'), nl,

    read(E),
    write('\e[H\e[2J'),
    mostraEstrutura(E).



% Mostra a estrutura escolhida em escolheEstrutura
mostraEstrutura(0) :- main().
mostraEstrutura(E) :- E > 0, length(spcShip, L), E =< L,     %% A refatorar 8 para tamanho de spcship
    Mx is spcShip,
    % plotMatrix ()
    write(E), nl,   %% Apenas para usar o parâmetro passado.
    write('Pressione um <Enter> para escolher outra estrutura'), nl,     %% Por hora, um caractere com ponto e enter
    read(_),
    escolheEstrutura().
mostraEstrutura(_) :- 
    nl, write('Opção inválida :('), nl,
    write('Pressione um <Enter> para voltar ao Menu'), nl,  %% Por hora, um caractere com ponto e enter
    read(_),
    write('\e[H\e[2J'),
    escolheEstrutura().
