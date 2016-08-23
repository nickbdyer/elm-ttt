module Lines exposing (..)

import Array exposing (Array, slice, length, map, initialize)

import Board exposing (Board, Mark(..))


getRows : Board -> Array (Array (Maybe Mark))
getRows board =
    getSlicePoints board
      |> map (\tuple -> slice (fst tuple) (snd tuple) board)


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



  

