module Lines exposing (..)

import Array exposing (Array, slice, length, map, initialize, get)

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



  

