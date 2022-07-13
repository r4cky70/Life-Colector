import System.Random

matrixGen :: Int -> Int -> [[Char]]
matrixGen width height =
  [([' ' | x <- [1..width]]) | y <- [1..height]]

checa :: [[Char]] -> Int -> Int -> Bool
checa matriz x y =
  if x == 0 || y == 0 || x == length matriz -1 || y == length (matriz!!0) -1
  then False
  else if matriz!!x!!y == '#'
  then (liveNeighbours >= 2 && liveNeighbours <= 3)
  else (liveNeighbours >= 3)

  where 
    aux = [matriz!!(x-1)!!y, matriz!!x!!(y-1), matriz!!(x+1)!!y, matriz!!x!!(y+1)]
    liveNeighbours = sum [1 | x<-aux, x == '#']
    

-- valida :: [[String]] -> [[String]]
-- valida matriz =
--   [char]

viewBoard :: [[Char]] -> IO()
viewBoard matriz = do
  putStrLn $ take ((length (matriz!!1))+2) (repeat '_')
  putStr $ unlines ["|" ++ x ++ "|" | x <- matriz]
  putStrLn $ take ((length (matriz!!1))+2) (repeat '-')
  
-- randSpaceship :: [[Char]] -> [[Char]]
-- randSpaceship matriz =
  
--   where
--     sp1 = ["#  ", " ##", "## "]
--     sp2 = ["  ## ", "## ##", "#### ", " ##  "]
--     spaceships = [sp1, sp2]


main = do
  let w = 8
      h = 8
  -- let matriz = (matrixGen w h)
  let matriz = [[' ',' ',' ',' ',' ',' ',' ',' '],[' ',' ','#',' ',' ',' ',' ',' '],[' ',' ',' ','#','#',' ',' ',' '],[' ',' ','#','#',' ',' ',' ',' '],[' ',' ',' ',' ',' ',' ',' ',' '],[' ',' ',' ',' ',' ',' ',' ',' '],[' ',' ',' ',' ',' ',' ','#',' '],[' ',' ',' ',' ',' ','#','#','#']]
  viewBoard matriz

  let matriz2 = [[if checa matriz x y then '#' else ' ' | x <- [0..(w-1)]]| y <- [0..(h-1)]]
  viewBoard matriz2
  print newRand
  -- print matriz2

