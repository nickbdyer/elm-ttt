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
    |> map (\cell -> button [] [(text cell)])
    |> toList


create2DBoard : Board -> List (Array String)
create2DBoard board =
  let
      size = length board
      width = sqrt (toFloat size)
      iter = initialize (round width) (\n -> (round width*n))
      rowSlicePoints = map (\num -> (num, (num + (round width)))) iter
  in
      rowSlicePoints
        |> map (\tuple -> slice (fst tuple) (snd tuple) board)
        |> toList

