module Tests exposing (..)

import Test exposing (..)
import BoardTest
import TicTacToeTest
import Expect
import String


all : Test
all =
    describe "All Tests"
        [ BoardTest.all
        , TicTacToeTest.all
        ]
