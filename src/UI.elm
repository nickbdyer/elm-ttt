module UI exposing (showBoard, Msg(..))

import Html exposing (Html, div, text, button)
import Html.App as Html
import Html.Events exposing (onClick)
import Board exposing (Board, Mark)
import Array exposing (Array, length, map, initialize, slice, toList)

type Msg = Mark

showBoard : Board -> Html Msg
showBoard board =
  div [] (showRows board)


showRows : Board -> List (Html Msg)
showRows board =
    List.map (\line -> div [] (showCells line)) (create2DBoard board)


showCells : List (Maybe Mark) -> List (Html Msg)
showCells line =
  line
    |> List.map (\cell -> button [onClick Mark] [(text (toString cell))])


create2DBoard : Board -> List (List (Maybe Mark))
create2DBoard board =
  let
      width = round (sqrt (toFloat (length board)))
      iter = initialize width (\n -> width*n)
      rowSlicePoints = map (\num -> (num, (num + width))) iter
  in
      rowSlicePoints
        |> map (\tuple -> toList (slice (fst tuple) (snd tuple) board))
        |> toList

