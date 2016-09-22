module TicTacToeTest exposing (..)

import Test exposing (..)
import Expect

import TicTacToe exposing (PlayState(..), update)
import Array exposing (get)
import Game exposing (board)
import Board exposing (Mark(..), full)
import UI exposing (Msg(..), GameType(..))


all : Test
all =
    describe "TicTacToe Test"
        [ test "When a cell is clicked, a move is played" <|
            \() ->
              let
                game = (Game.new (Board.new 3))
                updatedGame = update (HumanMove 5) {playState = InProgress game}
              in
                  case updatedGame.playState of
                    InProgress game -> board game
                      |> get 5
                      |> Expect.equal (Just (Just X))
                    _ -> Expect.fail "expected game to be in progress"

        , test "When a cell is clicked twice, the first move remains" <|
            \() ->
              let
                game = {playState = InProgress (Game.new (Board.new 3))}
                updatedGame = update (HumanMove 5) (update (HumanMove 5) game)
              in
                case updatedGame.playState of
                  InProgress game -> board game
                    |> get 5
                    |> Expect.equal (Just (Just X))
                  _ -> Expect.fail "expected game to be in progress"

         , test "A game can be reset" <|
            \() ->
              let
                game = (Game.new (Board.new 3))
              in
                update (HumanMove 5) {playState = InProgress game}
                  |> update Reset
                  |> Expect.equal {playState = NotStarted}

         , test "An unstarted game can be started after making a selection" <|
            \() ->
              let
                game = {playState = NotStarted}
              in
                update (SelectGameType HvH) game
                  |> Expect.equal {playState = InProgress (Game.new (Board.new 3))}

        ]



