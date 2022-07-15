module Game where

import Structures
import AdvanceGameState
import System.Process

matrixGen :: Int -> Int -> [[Char]]
matrixGen height width =
  [([' ' | x <- [1..width]]) | y <- [1..height]]




plotMatrix :: [[Char]] -> IO()
plotMatrix matriz = do
  putStrLn $ take ((length (matriz!!0))+2) (repeat '-')
  putStr $ unlines ["|" ++ x ++ "|" | x <- matriz]
  putStrLn $ take ((length (matriz!!0))+2) (repeat '-')
    
viewMatrix :: [[Char]] -> IO()
viewMatrix matriz = do
  system "cls"
  putStrLn ("1. Adicionar | q. Sair | [_]. Avançar | SZ: " ++  show (length (matriz)) ++ "x" ++ show (length (matriz!!0)))
  plotMatrix matriz



inputPlay :: [[Char]] -> String -> IO()
inputPlay mx "1" = do
  putStrLn ("Selecione a Estrutura para adicionar ao mapa")
  putStr $ unlines [(show x) ++ ". " ++ fst (spcship!!(x-1)) | x <- [1.. length spcship]]
  id <- getLine
  putStrLn "linha:"
  linha <- getLine
  putStrLn "Coluna:"
  coluna <- getLine
  let mx2 = insertSpaceship mx (read id) (read linha) (read coluna)
  viewMatrix mx2
  aux <- getLine
  inputPlay mx2 aux
inputPlay mx "q" = do
  --Main.main
  return()
inputPlay mx _ = do
  let mx2 = advanceGameState mx
  viewMatrix mx2
  aux <- getLine
  inputPlay mx2 aux


  

game :: Int -> Int -> IO()
game w h = do
  let matriz = (matrixGen w h)
  viewMatrix matriz
  move <- getLine
  inputPlay matriz move



iniciaJogo :: Int -> Int -> IO ()
iniciaJogo l c = do
  let matriz = (matrixGen l c)
  viewMatrix matriz
  move <- getLine
  inputPlay matriz move


