module Main where

import Game
import Structures

import Control.Exception
import System.IO
import System.IO.Error
import System.Process
import Data.List
import Data.Function



-- Função que exibe o menu
main :: IO()
main = do
            system "cls"
            putStrLn "----------------------------- Jogo da Vida -----------------------------"
            putStrLn "\nDigite 1 para jogar"
            putStrLn "\nDigite 2 para jogar com tabuleiro personalizado"
            putStrLn "\nDigite 3 para visualizar as estruturas"
            putStrLn "\nDigite 0 para sair"
            op <- getChar
            getChar
            system "cls"
            executaOpcao op


            
executaOpcao :: Char -> IO()
executaOpcao '1' = iniciaJogo 125 60
executaOpcao '2' = preparaJogo
executaOpcao '3' = escolheEstrutura
executaOpcao '0' = do
                            putStrLn ("\nAté uma próxima jogatina :)\n")
                            return ()
executaOpcao _ = do
                            putStrLn ("\nOpção inválida :(")
                            putStrLn ("\nPressione um <Enter> para voltar ao Menu")
                            getChar
                            main



preparaJogo = do
    putStrLn ("\nEscolha o tamanho do seu tabuleiro)\n")
    putStrLn ("\nInsira o número de linhas")
    l <- getLine
    putStrLn ("\nInsira o número de colunas")
    c <- getLine
    iniciaJogo (read l) (read c)


                
escolheEstrutura :: IO ()
escolheEstrutura = do
                    system "cls"
                    putStrLn ("Selecione uma estrutura para visualizar\n")
                    putStr $ unlines [(show x) ++ ". " ++ fst (spcship!!(x-1)) | x <- [1.. length spcship]]
                    putStrLn ("\nPressione 0 para voltar ao menu")
                    id <- getLine
                    system "cls"
                    mostraEstrutura (read id)



mostraEstrutura :: Int -> IO ()
mostraEstrutura x = if x > 0 && x <= length spcship then do
                        let mx = spcship
                        plotMatrix (snd (mx!!(x-1)))
                        putStrLn ("\nPressione um <Enter> para escolher outra estrutura")
                        getChar
                        escolheEstrutura
                    else 
                        if x == 0 then
                            main
                        else do                       
                            putStrLn ("\nOpção inválida, pressione um <Enter> para tentar novamente")
                            getChar
                            escolheEstrutura
