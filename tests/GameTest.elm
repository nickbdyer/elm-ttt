module GameTest exposing (..)

import Test exposing (..)
import Expect

import Game exposing (..)
import Board exposing (Mark(..), new)
import TestHelpers exposing (createDrawBoard, createXWinningBoard, createOWinningBoard)


all : Test
all =
    describe "Game Test"
        [ test "A new game knows the current player is X" <|
            \() ->
              (Game.new (Board.new 3))
                |> currentPlayer
                |> Expect.equal X

        , test "After processing one turn, the currentPlayer is O" <|
            \() ->
              (Game.new (Board.new 3))
                |> takeTurn (Just 4)
                |> currentPlayer
                |> Expect.equal O

        , test "After processing two turns, the currentPlayer is X" <|
            \() ->
              (Game.new (Board.new 3))
                |> takeTurn (Just 4)
                |> takeTurn (Just 5)
                |> currentPlayer
                |> Expect.equal X

        , test "Game will not mark board when in draw state" <|
            \() ->
              let
                  game = (Game.new (createDrawBoard))
              in
                takeTurn (Just 4) game
                  |> Expect.equal game

        , test "Game will not mark board when in win state" <|
            \() ->
              let
                  game = (Game.new (createOWinningBoard))
              in
                takeTurn (Just 4) game
                |> Expect.equal game

        ]


