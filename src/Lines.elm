module Lines exposing (getRows, getColumns, getDiagonals)

import Array exposing (..)
import List exposing (reverse)


getRows : Array (Maybe a) -> Array (Array (Maybe a))
getRows board =
  getSlicePoints board
    |> map (\tuple -> slice (fst tuple) (snd tuple) board)


getColumns : Array (Maybe a) -> Array (Array (Maybe a))
getColumns board = 
  let 
      rows = getRows board
      iter = initialize (length rows) identity
  in
      map (\columnNumber -> (makeColumn columnNumber rows)) iter


getDiagonals : Array (Maybe a) -> Array (Array (Maybe a))
getDiagonals board =
  let 
      rows = getRows board
      reversedRows = map (\row -> fromList (reverse (toList row))) rows
      leftDiagonal = getDiagonal rows
      rightDiagonal = getDiagonal reversedRows
  in
      push leftDiagonal empty
        |> push rightDiagonal


getDiagonal : Array (Array (Maybe a)) -> Array (Maybe a)
getDiagonal rows =
  let
      width = length rows
      iter = toList (initialize width identity)
      rowsAsList = toList rows
  in
      List.map2 (\row index -> get index row) rowsAsList iter 
        |> fromList
        |> flatMap


makeColumn : Int -> Array (Array (Maybe a)) -> Array (Maybe a)
makeColumn columnNum rows =
  let 
    row = map (\row -> get columnNum row) rows
  in
    flatMap row


flatMap : Array (Maybe (Maybe a)) -> Array (Maybe a)
flatMap array =
  array
    |> map (\cell ->
        case cell of
          Just (Just a) -> Just a
          _ -> Nothing) 


getSlicePoints : Array (Maybe a) -> Array (Int, Int)
getSlicePoints board =
  let 
      width = round (sqrt (toFloat (length board)))
      iter = initialize width (\n -> width*n)
  in
      map (\num -> (num, (num + width))) iter


