module TicTacToe exposing (..)

import Html exposing (Html, button, div, h1, text)
import Html.Events exposing (onClick)
import Html.App as Html
import Task
import Time exposing (millisecond)
import Process


import Board exposing (Board, Mark(..), new)
import UI exposing (Msg(..), showGameSelection, showGame)
import Game exposing (Game, GameType(..), takeTurn)
import Computer exposing (perfectMove)

main =
  Html.program
        { init = initialModel
        , update = update
        , view = view
        , subscriptions = (always Sub.none)
        }

-- MODEL

type PlayState = NotStarted | InProgress Game
type Player = Human | Ai
type alias Model = {playState : PlayState, nextPlayer : (Player, GameType)}

initialModel : (Model, Cmd Msg)
initialModel =
    ({playState = NotStarted, nextPlayer = (Human, HvH)}, Cmd.none)


-- UPDATE

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    SelectGameType HvH ->
      ({playState = InProgress (Game.new (Board.new 3)),
        nextPlayer = (Human, HvH)}, Cmd.none)

    SelectGameType HvC ->
      ({playState = InProgress (Game.new (Board.new 3)),
        nextPlayer = (Human, HvC)}, Cmd.none)

    SelectGameType CvH ->
      ({playState = InProgress (Game.new (Board.new 3)),
        nextPlayer = (Ai, CvH)}, triggerComputerMove)

    HumanMove position ->
      case model.playState of
        InProgress game ->
            let
              newModel = {playState = InProgress (takeTurn (Just position) game),
              nextPlayer = (getNextPlayer model.nextPlayer)}
            in
              case newModel.nextPlayer of
                (Ai, _) -> (newModel, triggerComputerMove)
                _ -> (newModel, Cmd.none)
        NotStarted -> ({playState = NotStarted, nextPlayer = (Human, HvH)}, Cmd.none)

    ComputerMove ->
      case model.playState of
        InProgress game ->
            let
              newModel = {playState = InProgress (takeTurn (perfectMove game) game),
              nextPlayer = (getNextPlayer model.nextPlayer)}
            in
              case newModel.nextPlayer of
                (Ai, _) -> (newModel, triggerComputerMove)
                _ -> (newModel, Cmd.none)
        NotStarted -> ({playState = NotStarted, nextPlayer = (Human, HvH)}, Cmd.none)

    _ -> ({playState = NotStarted, nextPlayer = (Human, HvH)}, Cmd.none)


-- VIEW

view : Model -> Html Msg
view model =
  case model.playState of
    NotStarted -> showGameSelection
    InProgress model -> showGame model


getNextPlayer : (Player, GameType) -> (Player, GameType)
getNextPlayer nextPlayerTuple =
  case nextPlayerTuple of
    (Human, HvC) -> (Ai, HvC)
    (Ai, HvC) -> (Human, HvC)
    (Human, CvH) -> (Ai, CvH)
    (Ai, CvH) -> (Human, CvH)
    (a, b) -> (a, b)

triggerComputerMove : Cmd Msg
triggerComputerMove =
  Task.perform (\_ -> ComputerMoveError) (\a -> ComputerMove) (Process.sleep (50 * millisecond))


