module UI exposing (..)

import Html exposing (Html, div, text, button)
import Html.App as Html
import Html.Events exposing (onClick)
import Html.Attributes exposing (value)

import Board exposing (Board, Row, Mark(..), getRows)

type Msg = Mark Int

showBoard : Board -> Html Msg
showBoard board =
  div [] (showRows board)


showRows : Board -> List (Html Msg)
showRows board =
    Board.map (\line -> div [] (showCells line)) (getRows board)


showCells : Row -> List (Html Msg)
showCells line =
  line
    |> Board.map (\mark -> Maybe.map toString mark)
    |> Board.map (\cell -> button [onClick (Mark 1)] [text (Maybe.withDefault "" cell)])
