module BoardTest exposing (..)

import Test exposing (..)
import Board exposing (..)
import Expect


all : Test
all =
    describe "Board Test"
        [ test "Addition" <|
            \() ->
                Expect.equal (3 + 7) 10
        ]

