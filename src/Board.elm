module Board exposing (..)

import Array exposing (Array, length, repeat, set)

type Mark = X | O

type alias Board = Array (Maybe Mark)


new : Int -> Board
new size = 
  repeat size Nothing


mark : Int -> Mark -> Board -> Board
mark position symbol board =
  set position (Just symbol) board


toArray : Board -> Array (Maybe Mark)
toArray board = 
  board
