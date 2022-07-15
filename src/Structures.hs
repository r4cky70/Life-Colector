module Structures where

spcship :: [([Char], [[Char]])] 
spcship = [
  ("Glider - cells=5", ["#  ", " ##", "## "]),
  ("Lightwight Spaceship - cells=9", ["  ## ", "## ##", "#### ", " ##  "]),
  ("Tsunami - cells=25", ["       ## #     ", "    ## # ## ### ", " ####  ##      #", "#    #   #   ## ", " ##             "]),
  ("Loafer - cells=20", [" ###  # #", "#  ## # #", " # ##  # ", "  #      ", "        #", "      ###", "     #  #", "      ## ", "      ## "]),
  ("Copper head - cells=28", ["  ####  ", "  #  #  ", " ###### ", "        ", "        ", "#  ##  #", "# #### #", "# #  # #", "        ", "        ", "   ##   ", "   ##   "]),
  ("Weekender - cells=36", [" #            # ", " #            # ", "# #          # #", " #            # ", " #            # ", "  #   ####   #  ", "      ####      ", "  ####    ####  ", "                ", "    #      #    ", "     ##  ##     "]),
  ("Everton", 
  ["### #  # ### #### ### ### #  #",
  "#   #  # #   #  #  #  # # ## #",
  "### #  # ### ####  #  # # # ##",
  "#   #  # #   ##    #  # # #  #",
  "###  ##  ### #  #  #  ### #  #"])
  ]


insertSpaceship :: [[Char]] -> Int -> Int -> Int -> [[Char]]
insertSpaceship mx id height width =
  if id > 0 && id <= length spcship && width >= 0 && height >= 0 then
  [
    [
      if x >= width && y >= height && x-width < length (ship!!1) && y-height < length ship
      then (ship)!!(y-height)!!(x-width)
      else mx!!y!!x | x <- [0.. ((length (mx!!1))-1)]
    ]
     | y <- [0.. ((length (mx))-1)]
  ]
  else
    mx
  where
    ship = snd (spcship!!(id-1))

    
    
