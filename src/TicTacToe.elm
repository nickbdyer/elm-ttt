module TicTacToe exposing (..)

import Html exposing (Html, button, div, h1, text)
import Html.Events exposing (onClick)
import Html.App as Html
import Board exposing (Board, Mark(..), new)
import UI exposing (Msg(..), showGameSelection, showGame)
import Game exposing (Game, GameType(..), takeTurn)
import Computer exposing (chooseMove)

main =
  Html.beginnerProgram { model = initialModel, update = update, view = view }

-- MODEL

type PlayState = NotStarted | InProgress Game
type Player = Human | Ai
type alias Model = {playState : PlayState, nextPlayer : (Player, GameType)}

initialModel : Model
initialModel =
    {playState = NotStarted, nextPlayer = (Human, HvH)}


-- UPDATE

update : Msg -> Model -> Model
update msg model =
  case msg of
    SelectGameType HvH ->
      {playState = InProgress (Game.new (Board.new 3)), nextPlayer = (Human, HvH)}

    SelectGameType HvC ->
      {playState = InProgress (Game.new (Board.new 3)), nextPlayer = (Human, HvC)}

    HumanMove position ->
      case model.playState of
        InProgress game -> {playState = InProgress (takeTurn (Just position) game), nextPlayer = (getNextPlayer model.nextPlayer)}
        NotStarted -> {playState = NotStarted, nextPlayer = (Human, HvH)}

    ComputerMove ->
      case model.playState of
        InProgress game -> {playState = InProgress (takeTurn (chooseMove game.board) game), nextPlayer = (getNextPlayer model.nextPlayer)}
        NotStarted -> {playState = NotStarted, nextPlayer = (Human, HvH)}

    _ -> {playState = NotStarted, nextPlayer = (Human, HvH)}


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


