module Board exposing (..)

import Array exposing (Array, repeat, set, get)

type alias Board = Array String

new : Int -> Board
new size = 
  repeat size ""

mark : Int -> String -> Board -> Board
mark position symbol board =
  set position symbol board


markAt : Int -> Board -> String
markAt position board =
  get position board
    |> Maybe.withDefault "" 
