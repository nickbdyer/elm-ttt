module UI exposing (Msg(..), showBoard, sliceInRows, getWidth)

import Html exposing (Html, div, text, button)
import Html.App as Html
import Html.Events exposing (onClick)
import Html.Attributes exposing (value)

import Board exposing (Board, Mark(..), toArray)
import Array exposing (..)

type Msg = Mark Int
type alias Row = List (Int, Maybe Mark)


showBoard : Board -> Html Msg
showBoard board =
  div [] (showRows board)


showRows : Array (Maybe Mark) -> List (Html Msg)
showRows board =
    List.map (\line -> div [] (showCells line)) (sliceInRows board)


showCells : Row -> List (Html Msg)
showCells line =
  line
    |> List.map (\mark -> ((fst mark), (Maybe.map toString (snd mark))))
    |> List.map (\cell -> 
      case (snd cell) of
        Just symbol -> button [] [text symbol]
        Nothing -> button [onClick (Mark (fst cell))] [text (Maybe.withDefault "" (snd cell))])


sliceInRows : Board -> List (List (Int, Maybe Mark))
sliceInRows board =
  let
      board = toArray board
      indexedBoard = embedIndexes board
      slicePoints = getSlicePoints indexedBoard
  in
      slicePoints
        |> map (\tuple -> toList (slice (fst tuple) (snd tuple) indexedBoard))
        |> toList


getSlicePoints : Array (Int, Maybe Mark) -> Array (Int, Int)
getSlicePoints board =
  let 
      width = getWidth board
      iter = initialize width (\n -> width*n)
  in
      map (\num -> (num, (num + width))) iter


embedIndexes : Array (Maybe Mark) -> Array (Int, Maybe Mark)
embedIndexes board =
  indexedMap (,) board


getWidth : Array a -> Int
getWidth board = 
  round (sqrt (toFloat (length board)))


