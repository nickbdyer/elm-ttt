module Computer exposing (..)

import Board exposing (Mark(..), toArray)
import Game exposing (Game)
import Array exposing (..)

chooseMove : Game -> Maybe Int
chooseMove game =
  let
    board = game.board
    indexedBoard = Array.indexedMap (,) (toArray board)
    availableMoves = Array.filter (\elem -> snd elem == Nothing) indexedBoard
  in
    case (get 0 availableMoves) of
     Just (a, b) -> Just a
     Nothing -> Nothing


perfectMove : Game -> Maybe Int
perfectMove board =
  Just 0



