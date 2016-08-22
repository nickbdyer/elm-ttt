module GameTest exposing (..)

import Test exposing (..)
import Expect

import Board exposing (Mark(..), new)
import Game exposing (..)

all : Test
all =
    describe "Game Test"
        [ test "A new game knows the current player is X" <|
            \() ->
              (Game.new (Board.new 9)).currentPlayer
                |> Expect.equal X
        ]

