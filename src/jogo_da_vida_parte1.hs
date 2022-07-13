
import Control.Exception
import System.IO
import System.IO.Error
import System.Process

-- Definição dos tipos de dados

type Jogadores = [Jogador]
type Nome = String
type Pontuacao = Int
type Tabela = [Char]
data Jogador = Jogador Nome Pontuacao deriving (Show, Read)


getString :: String -> IO String
getString str = do
                putStr str
                res <- getLine
                return res


-- Função que inicia o programa
main :: IO()
main= do
    {catch (le_arquivo) trata_erro;}
    where
        le_arquivo = do
            {
                arq <- openFile "dados.txt" ReadMode;
                dados <- hGetLine arq;
                hClose arq;
                menu (read dados);
                return()
            }
        trata_erro erro = if isDoesNotExistError erro then do {
                arq <- openFile "dados.txt" WriteMode;
                hPutStrLn arq "[]";
                hClose arq;
                menu [];
                return()
            }
            else ioError erro


-- Função que exibe o menu
menu :: Jogadores -> IO Jogadores
menu dados = do
            --system "cls"
            putStrLn "----------------------------- Jogo da Vida -----------------------------"
            putStrLn "\nDigite 1 para cadastrar novo jogador"
            putStrLn "\nDigite 2 para jogar"
            putStrLn "\nDigite 3 para visualizar o rank"
            putStrLn "\nDigite 0 para sair"
            putStr "Opções:"
            op <- getChar
            getChar 
            executaOpcao dados op


executaOpcao :: Jogadores -> Char -> IO Jogadores
executaOpcao dados '1' = cadastraJogador dados
executaOpcao dados '2' = preparaJogo dados
executaOpcao dados '0' = do
                            putStrLn ("\nAté uma próxima jogatina :)\n")
                            return dados
executaOpcao dados _ = do
                            putStrLn ("\nOpção inválida :(\n")
                            putStrLn ("\nPressione um <Enter> para voltar ao Menu\n")
                            getChar
                            menu dados



cadastraJogador :: Jogadores -> IO Jogadores
cadastraJogador dados = do
                        nome <- getString "\nDigite o nome do jogador: "
                        if (existeJogador dados nome) then do
                                                            putStrLn "\nEsse jogador já existe"
                                                            putStr "\nPressione <Enter> para continuar"
                                                            getChar
                                                            menu dados
                        else do
                                arq <- openFile "dados.txt" WriteMode
                                hPutStrLn arq (show ((Jogador nome 0): dados))
                                hClose arq
                                putStrLn ("\nUsuário " ++ nome ++ " cadastrado com sucesso")
                                putStr "\nPressione <Enter> para continuar"
                                getChar
                                menu ((Jogador nome 0): dados)



-- Função que verifica se um jogador já existe. O nome é único.
existeJogador :: Jogadores -> Nome -> Bool
existeJogador [] _ = False
existeJogador ((Jogador n p):xs) nome
            | (n == nome) = True
            | otherwise = existeJogador xs nome



-- Função que prepara o início do jogo
preparaJogo :: Jogadores -> IO Jogadores
preparaJogo dados = do
                    jogador <- getString "\nDigite o nome do jogador: "
                    -- Testa se o jogador existe
                    if not (existeJogador dados jogador) then do
                        putStrLn "\nJogador inexistente!"
                        putStr "\nPressione <Enter> para continuar"
                        getChar
                        menu dados
                    else do
                         novoJogo dados jogador



-- Função que inicia novo jogo
novoJogo :: Jogadores -> Nome -> IO Jogadores
novoJogo dados jogador = do
                            putStrLn ("\nIniciando o jogo")
                            rodaJogo dados (repeat 'c') jogador



-- Função que exibe a tabela
rodaJogo :: Jogadores -> Tabela -> Nome -> IO Jogadores
rodaJogo dados tabela jogador = menu dados
