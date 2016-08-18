module BoardTest exposing (..)

import Test exposing (..)
import Board exposing (..)
import Expect
import List exposing (isEmpty)


all : Test
all =
    describe "Board Test"
        [ test "A new board is empty" <|
            \() ->
              let
                  board = Board.new
              in
                Expect.true "Expected new board to be empty" (isEmpty board)
        ]

