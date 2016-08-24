module UI exposing (Msg(..), showBoard, sliceInRows, getWidth, showReset, showGameState)

import Html exposing (Html, h3, div, text, button, table, tr, td)
import Html.App as Html
import Html.Events exposing (onClick)
import Html.Attributes exposing (value)

import Board exposing (Board, Mark(..), toArray)
import Array exposing (..)
import Game exposing (Game, GameState(..), retrieveState, board)

type Msg = Mark Int | Reset
type alias Row = List (Int, Maybe Mark)


showGameState : Game -> Html a
showGameState game =
  case (retrieveState game) of
    Winner mark -> h3 [] [text ("The winner is " ++ (toString mark))]
    Draw -> h3 [] [text "It's a draw" ]
    InPlay -> h3 [] [text ((toString game.currentPlayer) ++ " it is your turn")]


showReset : Html Msg
showReset =
  button [onClick Reset] [ text "Reset" ]


showBoard : Game -> Html Msg
showBoard game =
  table [] (showRows (board game) (retrieveState game))


showRows : Array (Maybe Mark) -> GameState -> List (Html Msg)
showRows board state =
    List.map (\line -> tr [] (showCells line state)) (sliceInRows board)


showCells : Row -> GameState -> List (Html Msg)
showCells line state =
  line
    |> List.map (\mark -> ((fst mark), (Maybe.map toString (snd mark))))
    |> List.map (\cell -> 
      case ((snd cell), (state)) of
        (Just symbol, _ ) -> td [] [button [] [text symbol]]
        (Nothing, InPlay) -> td [] [button [onClick (Mark (fst cell))] [text ""]]
        (Nothing, _ )  -> td [] [button [] [text ""]])


sliceInRows : Board -> List (List (Int, Maybe Mark))
sliceInRows board =
  let
      board = toArray board
      indexedBoard = indexedMap (,) board
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


getWidth : Array a -> Int
getWidth board = 
  round (sqrt (toFloat (length board)))


