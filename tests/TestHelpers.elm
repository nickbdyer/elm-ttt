module TestHelpers exposing (..)

import Board exposing (..)

createDrawBoard : Board
createDrawBoard =
  Board.new 9
    |> Board.mark 0 X 
    |> Board.mark 1 X 
    |> Board.mark 2 O 
    |> Board.mark 3 O 
    |> Board.mark 4 O 
    |> Board.mark 5 X 
    |> Board.mark 6 X 
    |> Board.mark 7 O 
    |> Board.mark 8 X 

createXWinningBoard : Board
createXWinningBoard =
  Board.new 9
    |> Board.mark 0 X 
    |> Board.mark 3 O 
    |> Board.mark 1 X 
    |> Board.mark 4 O 
    |> Board.mark 2 X 


createOWinningBoard : Board
createOWinningBoard =
  Board.new 9
    |> Board.mark 0 O 
    |> Board.mark 3 X 
    |> Board.mark 1 O 
    |> Board.mark 4 X 
    |> Board.mark 2 O 
