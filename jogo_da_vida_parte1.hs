
import Control.Exception
import System.IO
import System.IO.Error
import System.Process

-- Definição dos tipos de dados

type Jogadores = [Jogador]
type Nome = String
type Pontuacao = Int
type Tabela = [Char]
data Jogador = Jogador Nome Pontuacao
                       deriving (Show, Read)


-- Função que inicia o programa
inicio :: IO()
inicio = do
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
executaOpcao dados '0' = do
                            putStrLn ("\nAté uma próxim jogatina :)\n")
                            return dados
executaOpcao dados _ = do
                            putStrLn ("\nOpção inválida :(\n")
                            menu dados