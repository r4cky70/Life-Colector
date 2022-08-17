


% Lista de estruturas especiais.
spcShips(
    [
    ["Glider - cells=5", ["#  ", " ##", "## "]],
    ["Lightwight Spaceship - cells=9", ["  ## ", "## ##", "#### ", " ##  "]],
    ["Tsunami - cells=25", ["       ## #     ", "    ## # ## ### ", " ####  ##      #", "#    #   #   ## ", " ##             "]],
    ["Loafer - cells=20", [" ###  # #", "#  ## # #", " # ##  # ", "  #      ", "        #", "      ###", "     #  #", "      ## ", "      ## "]],
    ["Copper head - cells=28", ["  ####  ", "  #  #  ", " ###### ", "        ", "        ", "#  ##  #", "# #### #", "# #  # #", "        ", "        ", "   ##   ", "   ##   "]],
    ["Weekender - cells=36", [" #            # ", " #            # ", "# #          # #", " #            # ", " #            # ", "  #   ####   #  ", "      ####      ", "  ####    ####  ", "                ", "    #      #    ", "     ##  ##     "]],
    ["Special Spaceship", 
    ["### #  # ### #### ### ### #  #",
    "#   #  # #   #  #  #  # # ## #",
    "### #  # ### ####  #  # # # ##",
    "#   #  # #   ##    #  # # #  #",
    "###  ##  ### #  #  #  ### #  #"]]
    ]
    ).


% Função que retorna uma estrutura e seu nome.
getShip(ID, Spc) :- spcShips(Ships), nth0(ID, Ships, Spc).  

    

% Função que insere uma estrutura especial em uma determinada coordenada do tabuleiro.
% insertSpaceShip(Mx, Id, Height, Width, R) :- 
%     Indice is Id -1,
%     spcShip(ShipList),
%     nth0(Indice, ShipList, SpcShipDesc),
%     last(SpcShipDesc, Ship).

    % (Id > 0, length(SpcShipDesc, L) Id =< L, Width >= 0, Height >= 0 ->
    %     R <- {[S2] & nth0(I2, S1, S2), I2 is (X - Width), nth0(I1, Ship, S1), I1 is (Y - Height), Y <- 0..Ms1, Ms1 is Ms -1, length(Mx, Ms) })
