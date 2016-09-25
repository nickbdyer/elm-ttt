module TicTacToeTest exposing (..)

import Test exposing (..)
import Expect

import TicTacToe exposing (PlayState(..), Player(..), update)
import Array exposing (get)
import Game exposing (GameType(..), board)
import Board exposing (Mark(..), full)
import UI exposing (Msg(..))


all : Test
all =
    describe "TicTacToe Test"
        [ test "When a cell is clicked, a move is played" <|
            \() ->
              let
                game = (Game.new (Board.new 3))
                updatedGame = update (HumanMove 5) {playState = InProgress game, nextPlayer = (Human, HvH)}
              in
                  case updatedGame.playState of
                    InProgress game -> board game
                      |> get 5
                      |> Expect.equal (Just (Just X))
                    _ -> Expect.fail "expected game to be in progress"

        , test "When a cell is clicked twice, the first move remains" <|
            \() ->
              let
                game = {playState = InProgress (Game.new (Board.new 3)), nextPlayer = (Human, HvH)}
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
                update (HumanMove 5) {playState = InProgress game, nextPlayer = (Human, HvH)}
                  |> update Reset
                  |> Expect.equal {playState = NotStarted, nextPlayer = (Human, HvH)}

         , test "An unstarted game can be started after making a selection" <|
            \() ->
                {playState = NotStarted, nextPlayer = (Human, HvH)}
                  |> update (SelectGameType HvH)
                  |> Expect.equal {playState = InProgress (Game.new (Board.new 3)), nextPlayer = (Human, HvH)}

         , test "A dumb computer move can be made" <|
            \() ->
              let
                game = (Game.new (Board.new 3))
                updatedGame = update (ComputerMove) {playState = InProgress game, nextPlayer = (Human, HvH)}
              in
                  case updatedGame.playState of
                    InProgress game -> board game
                      |> get 0
                      |> Expect.equal (Just (Just X))
                    _ -> Expect.fail "expected game to be in progress"

         , test "Computer move will occur automatically in Human vs Computer" <|
            \() ->
              let
                game = (Game.new (Board.new 3))
                updatedGame = update (ComputerMove) {playState = InProgress game, nextPlayer = (Human, HvC)}
              in
                  case updatedGame.playState of
                    InProgress game ->
                        let
                          grid = board game
                          marks = (get 0 grid, get 4 grid)
                        in
                         Expect.equal ((Just (Just X)), (Just (Just O))) marks
                    _ -> Expect.fail "expected game to be in progress"

         , test "Computer move will occur automatically in Computer vs Human" <|
            \() ->
              let
                game = {playState = NotStarted, nextPlayer = (Human, HvH)}
                updatedGame = update (SelectGameType CvH) game
              in
                case updatedGame.playState of
                  InProgress game -> board game
                      |> get 0
                      |> Expect.equal (Just (Just X))
                  _ -> Expect.fail "expected game to be in progress"
        ]



