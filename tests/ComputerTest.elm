module ComputerTest exposing (..)

import Test exposing (..)
import Expect

import Array

import Computer exposing (..)
import Board exposing (..)
import Game exposing (..)

all : Test
all =
    describe "Computer Test"
        [ test "A computer can choose a board position" <|
            \() ->
              Game.new (Board.new 3)
                |> Computer.chooseMove
                |> Expect.equal (Just 0)

        , test "will play center if the first player took a corner" <|
          \() ->
            {board = (Array.fromList [Just O, Just X, Just O,
                                      Nothing, Just X, Just O,
                                      Just X, Just O, Nothing ]),
            currentPlayer = X}
              |> Computer.perfectMove
              |> Expect.equal (Just 8)

        --, test "A computer will choose a the top left corner if the board is empty" <|
          --\() ->
            --Game.new (Board.new 3)
              --|> Computer.perfectMove
              --|> Expect.equal (Just 0)

        , test "will play center if the first player took a corner" <|
          \() ->
            {board = (Array.fromList [Just O, Nothing, Nothing,
                                      Nothing, Nothing, Nothing,
                                      Nothing, Nothing, Nothing]),
            currentPlayer = X}
              |> Computer.perfectMove
              |> Expect.equal (Just 4)

        , test "will win game if option is available" <|
          \() ->
            {board = (Array.fromList [Just X, Nothing, Just X,
                                      Nothing, Nothing, Nothing,
                                      Nothing, Nothing, Nothing]),
            currentPlayer = X}
              |> Computer.perfectMove
              |> Expect.equal (Just 1)

        , test "will stop win game if option is available" <|
          \() ->
            {board = (Array.fromList [Nothing, Just O, Nothing,
                                      Nothing, Nothing, Just O,
                                      Just X, Just X, Just O]),
            currentPlayer = X}
              |> Computer.perfectMove
              |> Expect.equal (Just 2)

        , test "will prevent diagonal fork" <|
          \() ->
            {board = (Array.fromList [Just X, Nothing, Nothing,
                                      Nothing, Just O, Nothing,
                                      Nothing, Nothing, Just O]),
            currentPlayer = X}
              |> Computer.perfectMove
              |> Expect.equal (Just 2)

        , test "will prevent another diagonal fork" <|
          \() ->
            {board = (Array.fromList [Just O, Nothing, Nothing,
                                      Nothing, Nothing, Just X,
                                      Nothing, Nothing, Just O]),
            currentPlayer = X}
              |> Computer.perfectMove
              |> Expect.equal (Just 4)

        , test "will prevent edge trap" <|
          \() ->
            {board = (Array.fromList [Nothing, Just O, Nothing,
                                      Just O, Just X, Nothing,
                                      Nothing, Nothing, Nothing]),
            currentPlayer = X}
              |> Computer.perfectMove
              |> Expect.equal (Just 0)

        , test "will prevent reverse edge trap" <|
          \() ->
            {board = (Array.fromList [Nothing, Nothing, Nothing,
                                      Nothing, Just X, Just O,
                                      Nothing, Just O, Nothing]),
            currentPlayer = X}
              |> Computer.perfectMove
              |> Expect.equal (Just 2)

        ]

