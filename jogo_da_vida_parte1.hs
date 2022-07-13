
import Control.Exception
import System.IO
import System.IO.Error
import System.Process
import Data.List
import Data.Function

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
main = do
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
            system "clear"
            putStrLn "----------------------------- Jogo da Vida -----------------------------"
            putStrLn "\nDigite 1 para cadastrar novo jogador"
            putStrLn "\nDigite 2 para jogar"
            putStrLn "\nDigite 3 para visualizar o rank"
            putStrLn "\nDigite 0 para sair"
            putStr "\nOpções: "
            op <- getChar
            getChar 
            executaOpcao dados op


executaOpcao :: Jogadores -> Char -> IO Jogadores
executaOpcao dados '1' = cadastraJogador dados
executaOpcao dados '2' = preparaJogo dados
executaOpcao dados '3' =  do
                            putStrLn "\nRanking dos jogadores\n"
                            if (null dados) then do
                                                    putStrLn "Não há jogadores cadastrados!"
                            else
                                -- Função que ordena de forma decrescente pelapontuação
                                exibeRanking (reverse (ordena dados))
                            putStrLn ("\nPressione um <Enter> para voltar ao Menu")
                            getChar
                            menu dados
executaOpcao dados '0' = do
                            putStrLn ("\nAté uma próxima jogatina :)\n")
                            return dados
executaOpcao dados _ = do
                            putStrLn ("\nOpção inválida :(")
                            putStrLn ("\nPressione um <Enter> para voltar ao Menu")
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



-- Função que exibe o ranking dos jogadores
-- Critério: da maior pontuação para a menor
exibeRanking :: Jogadores -> IO ()
exibeRanking [] = return ()
exibeRanking (x:xs) = do
                        putStrLn ((obterNome x) ++ " possui " ++ (show (obterPontuacao x)) ++ " pontos")
                        exibeRanking xs



-- Função que recebe um jogador e retorna o seu nome
obterNome :: Jogador -> Nome
obterNome (Jogador nome _) = nome



-- Função que recebe um jogador e retorna a sua pontuação
obterPontuacao :: Jogador -> Pontuacao
obterPontuacao (Jogador _ pontuacao) = pontuacao


-- Função que define o critério de ordenação
ordena :: Jogadores -> Jogadores
ordena dados = sortBy (compare `on` obterPontuacao) dados

-- geraEstruturas :: [[String]] -> [[String]]
-- geraEstruturas tabela = a
--     where
--         a = gliderGun tabela 0 0

-- gliderGun :: [[String]] -> [[String]] -> Int -> Int  -> [Int] -> [[String]]
-- gliderGun tabela ((y:ys):xs) ((length tabela) -1) ((lenght tabela !! 0) -1) temp = 
-- gliderGun tabela ((y:ys):xs) _ ((lenght() tabela !! 0) -1) = 

-- Função que exibe a tabela
rodaJogo :: Jogadores -> Tabela -> Nome -> IO Jogadores
rodaJogo dados tabela jogador = menu dados --do
                                    -- --putStrLn (showTabuleuiro 0 (lenght tabela))

                                    -- -- Verifica se jogador perdeu (condição de parada do jogo)
                                    -- if (jogadorPerdeu tabela pontuacao) then do
                                    --     putStrLn("Parabén, " ++ jogador ++ "! Você venceu!")

                                    --     -- Abre o arquivo no modo escrita para atualizar a pontuação
                                    --     arq_escrita <- openFile "dados.txt" WriteMode
                                    --     hPutStrLn arq_escrita (show (atualizaPontuacao dados jogador pontuiacao))
                                    --     hClose arq_escrita

                                    --     -- Abre o arquivo no modo leitura
                                    --     arq_leitura <- openFile "dados.txt" ReadMode
                                    --     dados_atualizados <- hGetLine arq_leitura
                                    --     hClose arq_leitura

                                    --     putStr "\nPressione <Enter> para voltar ao menu"
                                    --     getChar
                                    --     menu (read dados_atualizados)
                                    
                                    -- -- Sem interrupções
                                    -- else do



-- showTabuleiro :: Tabuleiro -> Int -> Int -> [Char]
-- showTabuleiro tabela indece tamanho
--                                     | (indice == tamanho -1) = ""
--                                     | otherwise
--                                                 | 