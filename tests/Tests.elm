module Tests exposing (..)

import Test exposing (..)
import Expect


import BoardTest
import TicTacToeTest
import GameTest
import UITest
import LinesTest

all : Test
all =
    describe "All Tests"
        [ BoardTest.all
        , UITest.all
        , GameTest.all
        , TicTacToeTest.all
        , LinesTest.all
        ]
