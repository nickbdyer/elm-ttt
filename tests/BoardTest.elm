module BoardTest exposing (..)

import Test exposing (..)
import Expect

import Array exposing (length, repeat, get)

import Board exposing (..)
import TestHelpers exposing (createFullBoard, createXWinningBoard, createOWinningBoard)

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

        , test "A board knows if X is the winner" <|
            \() ->
              winner createXWinningBoard
                |> Expect.equal (Just X)

        , test "A board knows if O is the winner" <|
            \() ->
              winner createOWinningBoard
                |> Expect.equal (Just O)
        ]

