module Lines exposing (..)

import Array exposing (..)
import List exposing (reverse)

import Board exposing (Board, Mark(..))


getRows : Board -> Array (Array (Maybe Mark))
getRows board =
  getSlicePoints board
    |> map (\tuple -> slice (fst tuple) (snd tuple) board)


getColumns : Board -> Array (Array (Maybe Mark))
getColumns board = 
  let 
      rows = getRows board
      width = getWidth board
      iter = initialize width identity
  in
      map (\columnNumber -> (makeColumn columnNumber rows)) iter

getDiagonals : Board -> Array (Array (Maybe Mark))
getDiagonals board =
  let 
      rows = getRows board
      reverseRows = map (\row -> fromList (reverse (toList row))) rows
      leftDiagonal = getDiagonal rows
      rightDiagonal = getDiagonal reverseRows
  in
      empty
        |> push leftDiagonal
        |> push rightDiagonal


getDiagonal : Array (Array (Maybe Mark)) -> Array (Maybe Mark)
getDiagonal rows =
  let
      width = length rows
      iter = toList (initialize width identity)
      rowsAsList = toList rows
  in
      List.map2 (\row index -> get index row) rowsAsList iter 
        |> fromList
        |> map (\elem -> 
          case elem of
            Just (Just a) -> Just a
            Just (Nothing) -> Nothing
            Nothing -> Nothing) 



makeColumn : Int -> Array (Array (Maybe Mark)) -> Array (Maybe Mark)
makeColumn columnNum rows =
  flatMap (\row -> get columnNum row) rows


flatMap : (a -> Maybe (Maybe Mark)) -> Array a -> Array (Maybe Mark)
flatMap function array =
  let
    row = map function array
  in
    map (\cell ->
      case cell of
        Just (Just a) -> Just a
        Just (Nothing) -> Nothing
        Nothing -> Nothing) row


getSlicePoints : Board -> Array (Int, Int)
getSlicePoints board =
  let 
      width = getWidth board
      iter = initialize width (\n -> width*n)
  in
      map (\num -> (num, (num + width))) iter


getWidth : Board -> Int
getWidth board = 
  round (sqrt (toFloat (length board)))



  

