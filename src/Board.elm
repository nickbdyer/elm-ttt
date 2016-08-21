module Board exposing (..)

import Array exposing (Array, length, repeat, set, get, map, slice, initialize, toList)

type Mark = X | O

type alias Board = Array (Maybe Mark)
type alias Row = List (Maybe Mark)


new : Int -> Board
new size = 
  repeat size Nothing


mark : Int -> Mark -> Board -> Board
mark position symbol board =
  set position (Just symbol) board


getWidth : Board -> Int
getWidth board = 
  round (sqrt (toFloat (length board)))


getRows : Board -> List (List (Maybe Mark))
getRows board =
  let
      width = getWidth board
      iter = initialize width (\n -> width*n)
      rowSlicePoints = Array.map (\num -> (num, (num + width))) iter
  in
      rowSlicePoints
        |> Array.map (\tuple -> toList (slice (fst tuple) (snd tuple) board))
        |> toList


map : (a -> b) -> List a -> List b
map function board = 
  List.map function board
