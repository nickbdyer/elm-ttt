port module Main exposing (..)

import Tests
import BoardTest
import TicTacToeTest
import Test.Runner.Node exposing (run)
import Json.Encode exposing (Value)


main : Program Value
main =
    run emit Tests.all


port emit : ( String, Value ) -> Cmd msg
