module TicTacToeTest exposing (..)

import Test exposing (..)
import Expect


all : Test
all =
    describe "TicTacToe Test"
        [ test "Addition" <|
            \() ->
                Expect.equal (3 + 7) 10
        ]


