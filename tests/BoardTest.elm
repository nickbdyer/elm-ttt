module BoardTest exposing (..)

import Test exposing (..)
import Expect

import Array exposing (length, repeat, get)

import Board exposing (..)

all : Test
all =
    describe "Board Test"
        [ test "A new board is empty" <|
            \() ->
              Board.new 9
                |> Expect.equal (repeat 9 Nothing)

        , test "A board can be given a size" <|
            \() ->
              Board.new 9
                |> length
                |> Expect.equal 9 

        , test "A board can be marked" <|
            \() ->
              Board.new 9
                |> Board.mark 4 X 
                |> get 4
                |> Expect.equal (Just (Just X))

        , test "A board knows if it is full" <|
            \() ->
              Expect.true "Expected board to be full" (full createFullBoard)

        --, test "A board knows if X is the winner" <|
            --\() ->
              --winner createXWinningBoard
                --|> Expect.equal (Just X)

        --, test "A board knows if O is the winner" <|
            --\() ->
              --winner createOWinningBoard
                --|> Expect.equal (Just O)
        ]

createFullBoard : Board
createFullBoard =
  Board.new 9
    |> Board.mark 0 X 
    |> Board.mark 1 O 
    |> Board.mark 2 O 
    |> Board.mark 3 O 
    |> Board.mark 4 X 
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
