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
  if id > 0 && id <= length spcship && height >= 0 && width >= 0 then
  [
    [
      if x >= height && y >= width && x-height < length (ship!!1) && y-width < length ship
      then (ship)!!(y-width)!!(x-height)
      else mx!!y!!x | x <- [0.. ((length (mx!!1))-1)]
    ]
     | y <- [0.. ((length (mx))-1)]
  ]
  else
    mx
  where
    ship = snd (spcship!!(id-1))

    
    
