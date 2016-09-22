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
type alias Model = {playState : PlayState}

initialModel : Model
initialModel =
    {playState = NotStarted}


-- UPDATE

update : Msg -> Model -> Model
update msg model =
  case msg of
    SelectGameType HvH ->
      {playState = InProgress (Game.new (Board.new 3))}
    SelectGameType HvC ->
      {playState = InProgress (Game.new (Board.new 3))}
    HumanMove position ->
      case model.playState of
        InProgress game -> {playState = InProgress (takeTurn (Just position) game)}
        NotStarted -> {playState = NotStarted}
    ComputerMove ->
      case model.playState of
        InProgress game -> {playState = InProgress (takeTurn (chooseMove game.board) game)}
        NotStarted -> {playState = NotStarted}
    _ -> {playState = NotStarted }


-- VIEW

view : Model -> Html Msg
view model =
  case model.playState of
    NotStarted -> showGameSelection
    InProgress model -> showGame model
