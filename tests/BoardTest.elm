module BoardTest exposing (..)

import Test exposing (..)
import Expect

import Array exposing (length)

import Board exposing (..)

all : Test
all =
    describe "Board Test"
        [ test "A new board is empty" <|
            \() ->
              Board.new 9
                |> Expect.equal [Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing]
        , test "A board can be given a size" <|
            \() ->
              Board.new 9
                |> length
                |> Expect.equal 9 
        , test "A board can be marked" <|
            \() ->
              Board.new 9
                |> Board.mark 4 X 
                |> Board.markAt 4
                |> Expect.equal X
        ]

