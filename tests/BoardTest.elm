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

        , test "A board of size 9 has a row width of 3" <|
            \() ->
              getWidth (Board.new 9)
                |> Expect.equal 3

        , test "A board of size 16 has a row width of 4" <|
            \() ->
              getWidth (Board.new 16)
                |> Expect.equal 4
        ]

