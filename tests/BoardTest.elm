module BoardTest exposing (..)

import Test exposing (..)
import Expect

import Array exposing (length, repeat, get)

import Board exposing (..)
import TestHelpers exposing (createDrawBoard, createXWinningBoard, createOWinningBoard)

all : Test
all =
    describe "Board Test"
        [ test "A board can be created with a size" <|
            \() ->
              Board.new 3
                |> length
                |> Expect.equal 9

        , test "A new board has no marks inside" <|
            \() ->
              Board.new 3
                |> Board.toArray
                |> Expect.equal (repeat 9 Nothing)

        , test "A board can be marked" <|
            \() ->
              Board.new 3
                |> Board.mark 4 X
                |> Board.toArray
                |> get 4
                |> Expect.equal (Just (Just X))

        , test "A board knows if it is full" <|
            \() ->
              Expect.true "Expected board to be full" (full createDrawBoard)

        , test "A board knows if it is not full" <|
            \() ->
              Expect.false "Expected board not to be full" (full createXWinningBoard)

        , test "A board knows if X is the winner" <|
            \() ->
              winner createXWinningBoard
                |> Expect.equal (Just X)

        , test "A board knows if X is not the winner" <|
            \() ->
              winner createDrawBoard
                |> Expect.notEqual (Just X)

        , test "A board knows if O is the winner" <|
            \() ->
              winner createOWinningBoard
                |> Expect.equal (Just O)

        , test "A board knows if O is not the winner" <|
            \() ->
              winner createDrawBoard
                |> Expect.notEqual (Just O)
        ]

