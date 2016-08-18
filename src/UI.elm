module UI exposing (showBoard, Msg(..))

import Html exposing (Html, div, text, button)
import Html.App as Html
import Html.Events exposing (onClick)
import Board exposing (Board)
import Array exposing (Array, length, map, initialize, slice, toList)

type Msg = Mark

showBoard : Board -> Html Msg
showBoard board =
  div [] (showRows board)


showRows : Board -> List (Html Msg)
showRows board =
  (create2DBoard board)
    |> List.map (\line -> div [] (showCells line)) 


showCells : List String -> List (Html Msg)
showCells line =
  line
    |> List.map (\cell -> button [onClick Mark] [(text cell)])


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

