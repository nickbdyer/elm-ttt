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
              Board.new 0
                |> isEmpty
                |> Expect.true "Expected new board to be empty"
        , test "A board can be given a size" <|
            \() ->
                Board.new 9
                  |> length
                  |> Expect.equal 9 
        , test "A board can be marked" <|
            \() ->
              Board.new 9
                |> Board.mark 4 "X" 
                |> Board.markAt 4
                |> Expect.equal "X"

        ]

