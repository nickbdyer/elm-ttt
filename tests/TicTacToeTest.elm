module TicTacToeTest exposing (..)

import Test exposing (..)
import Expect

import TicTacToe exposing (update)
import Array exposing (get)
import Game exposing (board)
import Board exposing (Mark(..))
import UI exposing (Msg(..))


all : Test
all =
    describe "TicTacToe Test"
        [ test "When a cell is clicked, a move is played" <|
            \() ->
              let
                game = (Game.new (Board.new 3))
              in
                update (TakeTurn 5) game
                  |> board
                  |> get 5
                  |> Expect.equal (Just (Just X))

        , test "When a cell is clicked twice, the first move remains" <|
            \() ->
              let
                game = (Game.new (Board.new 3))
              in
                game
                  |> update (TakeTurn 5)
                  |> update (TakeTurn 5)
                  |> board
                  |> get 5
                  |> Expect.equal (Just (Just X))

         , test "A game can be reset" <|
            \() ->
              let
                game = (Game.new (Board.new 3))
              in
                update (TakeTurn 5) game
                  |> update Reset
                  |> Expect.equal game

        ]



