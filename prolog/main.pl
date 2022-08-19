:- encoding(utf8).

:-[structures].
:-[game].


mainGame() :- 
    limpa(),
    writeln('----------------------------- Jogo da Vida -----------------------------'),
    writeln('Digite 1 para jogar'),
    writeln('Digite 2 para jogar com tabuleiro personalizado'),
    writeln('Digite 3 para visualizar as estruturas'),
    writeln('Digite 0 para sair'),

    read_line_to_string(user_input, O),
    limpa(),
    executaOpcao(O).



% Executa a opção escolhida        com ponto no final
executaOpcao("1") :- iniciaJogo(35, 150).
executaOpcao("2") :- preparaJogo().
executaOpcao("3") :- escolheEstrutura().
executaOpcao("0") :-
                saiMain().
executaOpcao(_) :-
                nl, write('Opção inválida :('), nl,
                writeln('Pressione um <Enter> para voltar ao Menu'),  %% Por hora, um caractere com ponto e enter
                read_line_to_string(user_input, _),
                limpa(),
                mainGame().



preparaJogo() :- 
    writeln('Escolha o tamanho do seu tabuleiro'),
    writeln('Insira o número de linhas'),
    read_line_to_string(user_input, S),
    number_string(R, S), nl,
    writeln('Insira o número de colunas'),
    read_line_to_string(user_input, P),
    number_string(C, P),
    iniciaJogo(R, C).
    



% Lista o nome das estruturas presentes.
escolheEstrutura() :-
    limpa(),
    writeln('Selecione uma estrutura para visualizar'), nl, 
    menuEstruturas(0), nl,
    writeln('Pressione 0 para voltar ao menu'),
    read_line_to_string(user_input, S),
    number_string(E, S),
    limpa(),
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
    write('Pressione um <Enter> para escolher outra estrutura'), nl,
    read_line_to_string(user_input, _),
    escolheEstrutura().
mostraEstrutura(_) :- 
    nl, writeln('Opção inválida :('),
    writeln('Pressione um <Enter> para voltar ao Menu'),
    read_line_to_string(user_input, _),
    limpa(),
    escolheEstrutura().


% Função que limpa a tela.
limpa() :- write('\e[H\e[2J').


% Função para sair do jogo.
saiMain() :-
    nl, writeln('Até uma próxima jogatina :)'), halt().
