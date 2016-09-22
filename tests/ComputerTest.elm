module ComputerTest exposing (..)

import Test exposing (..)
import Expect

import Computer exposing (..)
import Board exposing (..)

all : Test
all =
    describe "Computer Test"
        [ test "A computer can choose a board position" <|
            \() ->
              Board.new 3
                |> Computer.chooseMove
                |> Expect.equal (Just 0)

        , test "A computer will choose a the top left corner if the board is empty" <|
          \() ->
            Board.new 3
              |> Computer.perfectMove
              |> Expect.equal (Just 0)

        ]

