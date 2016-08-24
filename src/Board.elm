module Board exposing (Board, Mark(..), new, mark, toArray, full, winner)

import Array exposing (..)

import Lines exposing (getRows, getColumns, getDiagonals)

type Mark = X | O
type alias Board = Array (Maybe Mark)


new : Int -> Board
new size = 
  repeat size Nothing


mark : Int -> Mark -> Board -> Board
mark position symbol board =
  case (get position board) of
    Just (Just x) -> board
    _ -> set position (Just symbol) board


toArray : Board -> Array (Maybe Mark)
toArray board = 
  board


full : Board -> Bool
full board = 
  List.all isMarkedCell (toList board)


isMarkedCell : Maybe Mark -> Bool
isMarkedCell mark =
  case mark of
    Just _ -> True
    Nothing -> False


winner : Board -> Maybe Mark
winner board =
  let
      combos = getCombosList board
      potentialWinners = map winnerOnLine combos
  in 
      Maybe.oneOf (toList potentialWinners)


getCombosList : Board -> Array (Array (Maybe Mark))
getCombosList board =
  let 
      rows = getRows board
      columns = getColumns board
      diagonals = getDiagonals board
  in
      append rows columns
       |> append diagonals


winnerOnLine : Array (Maybe Mark) -> Maybe Mark
winnerOnLine line =
  case (toList line) of
    [Just X, Just X, Just X] -> Just X
    [Just O, Just O, Just O] -> Just O
    _ -> Nothing
