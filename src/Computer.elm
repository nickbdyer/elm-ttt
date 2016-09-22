module Computer exposing (..)

import Board exposing (Board, Mark(..), toArray)
import Array exposing (..)

chooseMove : Board -> Maybe Int
chooseMove board =
  let
    indexedBoard = Array.indexedMap (,) (toArray board)
    availableMoves = Array.filter (\elem -> snd elem == Nothing) indexedBoard
  in
    case (get 0 availableMoves) of
     Just (a, b) -> Just a
     Nothing -> Nothing

perfectMove : Board -> Maybe Int
perfectMove board =
  Just 0



