module Board exposing (..)

import List exposing (repeat)

type alias Board = List String

new : Int -> Board
new size = 
  repeat size ""
