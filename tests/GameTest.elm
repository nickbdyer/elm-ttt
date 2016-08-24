module GameTest exposing (..)

import Test exposing (..)
import Expect

import Game exposing (..)
import Board exposing (Mark(..), new)
import TestHelpers exposing (createFullBoard, createXWinningBoard, createOWinningBoard)


all : Test
all =
    describe "Game Test"
        [ test "A new game knows the current player is X" <|
            \() ->
              (Game.new (Board.new 9))
                |> currentPlayer
                |> Expect.equal X

        , test "After processing a turn, the currentPlayer is O" <|
            \() ->
              (Game.new (Board.new 9))
                |> takeTurn 4
                |> currentPlayer
                |> Expect.equal O

        , test "After processing two turns, the currentPlayer is X" <|
            \() ->
              (Game.new (Board.new 9))
                |> takeTurn 4
                |> takeTurn 5
                |> currentPlayer
                |> Expect.equal X

        , test "Game knows when the game is inplay" <|
            \() ->
              (Game.new (Board.new 9))
                |> retrieveState
                |> Expect.equal InPlay

        , test "Game knows when the game is a draw" <|
            \() ->
              (Game.new (createFullBoard))
                |> retrieveState
                |> Expect.equal Draw

        , test "Game knows when the game has X winner" <|
            \() ->
              (Game.new (createXWinningBoard))
                |> retrieveState
                |> Expect.equal (Winner X)

        , test "Game knows when the game has O winner" <|
            \() ->
              (Game.new (createOWinningBoard))
                |> retrieveState
                |> Expect.equal (Winner O)
        ]


