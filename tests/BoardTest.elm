module BoardTest exposing (..)

import Test exposing (..)
import Board exposing (..)
import Expect
import List exposing (isEmpty, length)


all : Test
all =
    describe "Board Test"
        [ test "A new board is empty" <|
            \() ->
              let
                  board = Board.new 0
              in
                Expect.true "Expected new board to be empty" (isEmpty board)
        , test "A board can be given a size" <|
            \() ->
              let
                  board = Board.new 9
              in
                  Expect.equal 9 (length board)

        ]

