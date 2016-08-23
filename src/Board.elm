module Board exposing (..)

import Array exposing (Array, length, repeat, set, get, toList)

type Mark = X | O

type alias Board = Array (Maybe Mark)


new : Int -> Board
new size = 
  repeat size Nothing


mark : Int -> Mark -> Board -> Board
mark position symbol board =
  case (get position board) of
    Just (Just x) -> board
    Just (Nothing) -> set position (Just symbol) board
    Nothing -> set position (Just symbol) board


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
