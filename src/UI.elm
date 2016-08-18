module UI exposing (showBoard)

import Html exposing (Html, div, text, button)
import Html.App as Html
import Board exposing (Board)
import Array exposing (Array, length, map, initialize, slice, toList)

showBoard : Board -> Html a
showBoard board =
  div [] (showRows board)


showRows : Board -> List (Html a)
showRows board =
  (create2DBoard board)
    |> List.map (\line -> div [] (showCells line)) 


showCells line =
  line
    |> List.map (\cell -> button [] [(text cell)])


create2DBoard : Board -> List (List String)
create2DBoard board =
  let
      width = round (sqrt (toFloat (length board)))
      iter = initialize width (\n -> width*n)
      rowSlicePoints = map (\num -> (num, (num + width))) iter
  in
      rowSlicePoints
        |> map (\tuple -> toList (slice (fst tuple) (snd tuple) board))
        |> toList

