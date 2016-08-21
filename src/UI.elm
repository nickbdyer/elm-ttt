module UI exposing (..)

import Html exposing (Html, div, text, button)
import Html.App as Html
import Html.Events exposing (onClick)

import Board exposing (Board, Mark(..), getWidth, getRows)
import Array exposing (Array, map, initialize, slice, toList)

type Msg = Mark

showBoard : Board -> Html Msg
showBoard board =
  div [] (showRows board)


showRows : Board -> List (Html Msg)
showRows board =
    List.map (\line -> div [] (showCells line)) (getRows board)


showCells : List (Maybe Mark) -> List (Html Msg)
showCells line =
  line
    |> List.map (\mark -> Maybe.map toString mark)
    |> List.map (\cell -> button [onClick Mark] [text (Maybe.withDefault "" cell)])
