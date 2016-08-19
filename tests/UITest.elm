module UITest exposing (..)

import Test exposing (..)
import Expect

import Board
import List exposing (repeat)
import UI exposing (create2DBoard)


all : Test
all =
    describe "UI Test"
        [ test "UI can map board into rows" <|
            \() ->
              create2DBoard (Board.new 9)
                |> Expect.equal (repeat 3 (repeat 3 Nothing))
        ]


