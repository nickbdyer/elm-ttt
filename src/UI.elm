module UI exposing (..)

import Html exposing (Html, div, text, button)
import Html.App as Html
import Html.Events exposing (onClick)
import Board exposing (Board, Mark(..))
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
    |> List.map (\mark -> Maybe.map toString mark)
    |> List.map (\cell -> button [onClick Mark] [text (Maybe.withDefault "" cell)])


create2DBoard : Board -> List (List (Maybe Mark))
create2DBoard board =
  let
      width = getBoardWidth board
      iter = initialize width (\n -> width*n)
      rowSlicePoints = map (\num -> (num, (num + width))) iter
  in
      rowSlicePoints
        |> map (\tuple -> toList (slice (fst tuple) (snd tuple) board))
        |> toList


getBoardWidth : Board -> Int
getBoardWidth board = 
  round (sqrt (toFloat (length board)))

