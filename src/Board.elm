module Board exposing (..)

import List exposing (repeat, take, drop, head)

type alias Board = List String

new : Int -> Board
new size = 
  repeat size ""

mark : Int -> String -> Board -> Board
mark position symbol board =
  let
      start = take (position - 1) board
      end = drop position board
      newMark = [symbol]
  in
      start ++ newMark ++ end

markAt : Int -> Board -> String
markAt position board =
  board
    |> drop (position - 1)
    |> head
    |> Maybe.withDefault ""
