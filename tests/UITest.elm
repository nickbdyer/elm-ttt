module UITest exposing (..)

import Test exposing (..)
import Expect

import Board
import List exposing (repeat)
import UI exposing (create2DBoard, getBoardWidth)


all : Test
all =
    describe "UI Test"
        [ test "A board of size 9 has a row width of 3" <|
            \() ->
              getBoardWidth (Board.new 9)
                |> Expect.equal 3
        , test "A board of size 16 has a row width of 4" <|
            \() ->
              getBoardWidth (Board.new 16)
                |> Expect.equal 4
        , test "UI can map board into rows" <|
            \() ->
              create2DBoard (Board.new 9)
                |> Expect.equal (repeat 3 (repeat 3 Nothing))
        ]


