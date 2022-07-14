module AdvanceGameState where

checa :: [[Char]] -> Int -> Int -> Bool
checa mx y x =
  if x == 0 || y == 0 || x == length mx -1 || y == length (mx!!0) -1
  then False
  else if mx!!x!!y == '#'
  then (liveNeighbours >= 2 && liveNeighbours <= 3)
  else (liveNeighbours == 3)

  where 
    aux = [mx!!(x-1)!!y, mx!!x!!(y-1), mx!!(x+1)!!y, mx!!x!!(y+1), mx!!(x+1)!!(y+1), mx!!(x-1)!!(y+1), mx!!(x+1)!!(y-1), mx!!(x-1)!!(y-1)]
    liveNeighbours = sum [1 | x<-aux, x == '#']

advanceGameState :: [[Char]] -> [[Char]]
advanceGameState mx =
  [[if checa mx x y then '#' else ' ' | x <- [0..(w-1)]]| y <- [0..(h-1)]]
  where
    w = length (mx!!1)
    h = length mx