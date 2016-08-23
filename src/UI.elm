module UI exposing (Msg(..), showBoard, sliceInRows, getWidth, showReset)

import Html exposing (Html, div, text, button, table, tr, td)
import Html.App as Html
import Html.Events exposing (onClick)
import Html.Attributes exposing (value)

import Board exposing (Board, Mark(..), toArray)
import Array exposing (..)

type Msg = Mark Int | Reset
type alias Row = List (Int, Maybe Mark)


showReset : Html Msg
showReset =
  button [onClick Reset] [ text "Reset" ]

showBoard : Board -> Html Msg
showBoard board =
  table [] (showRows board)


showRows : Array (Maybe Mark) -> List (Html Msg)
showRows board =
    List.map (\line -> tr [] (showCells line)) (sliceInRows board)


showCells : Row -> List (Html Msg)
showCells line =
  line
    |> List.map (\mark -> ((fst mark), (Maybe.map toString (snd mark))))
    |> List.map (\cell -> 
      case (snd cell) of
        Just symbol -> td [] [button [] [text symbol]]
        Nothing -> td [] [button [onClick (Mark (fst cell))] [text ""]])


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


