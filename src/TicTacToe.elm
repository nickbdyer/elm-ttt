module TicTacToe exposing (..)

import Html exposing (Html, button, div, h1, text)
import Html.Events exposing (onClick)
import Html.App as Html
import Board exposing (Board, Mark(..), new)
import UI exposing (Msg(..), showBoard, showReset, showGameState)
import Game exposing (Game, takeTurn)

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
    GameType "HvH" ->
      {playState = InProgress (Game.new (Board.new 3))}
    GameType "HvC" ->
      {playState = InProgress (Game.new (Board.new 3))}
    TakeTurn position ->
      case model.playState of
        InProgress model -> {playState = InProgress (takeTurn position model)}
        NotStarted -> {playState = NotStarted}
    _ -> {playState = NotStarted }


-- VIEW

view : Model -> Html Msg
view model =
  case model.playState of
    NotStarted -> div [] [
      button [onClick (GameType "HvH")] [text "Human vs Human"],
      button [onClick (GameType "HvC")] [text "Human vs Computer"]
      ]
    InProgress model -> div [] [
      h1 [] [ text "Tic Tac Toe" ],
      showGameState model,
      showBoard model,
      showReset
    ]
