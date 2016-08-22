module Tests exposing (..)

import Test exposing (..)
import BoardTest
import GameTest
import UITest
import Expect
import String


all : Test
all =
    describe "All Tests"
        [ BoardTest.all
        , UITest.all
        , GameTest.all
        ]
