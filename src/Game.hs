module Game where

import Structures
import AdvanceGameState
import System.Process

matrixGen :: Int -> Int -> [[Char]]
matrixGen width height =
  [([' ' | x <- [1..width]]) | y <- [1..height]]


    
viewBoard :: [[Char]] -> IO()
viewBoard matriz = do
  system "cls"
  putStrLn ("1. Adicionar | q. Sair | [_]. Avançar | SZ: " ++ show (length (matriz!!0)) ++ "x" ++ show (length (matriz)))
  putStrLn $ take ((length (matriz!!0))+2) (repeat '-')
  putStr $ unlines ["|" ++ x ++ "|" | x <- matriz]
  putStrLn $ take ((length (matriz!!0))+2) (repeat '-')



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
  viewBoard mx2
  aux <- getLine
  inputPlay mx2 aux
inputPlay mx "q" = do
  --Main.main
  return()
inputPlay mx _ = do
  let mx2 = advanceGameState mx
  viewBoard mx2
  aux <- getLine
  inputPlay mx2 aux


  

game :: Int -> Int -> IO()
game w h = do
  let matriz = (matrixGen w h)
  viewBoard matriz
  move <- getLine
  inputPlay matriz move




preparaJogo = do
  let w = 120
      h = 40
  let matriz = (matrixGen w h)
  viewBoard matriz
  move <- getLine
  inputPlay matriz move


