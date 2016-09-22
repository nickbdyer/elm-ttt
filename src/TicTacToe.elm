module TicTacToe exposing (..)

import Html exposing (Html, button, div, h1, text)
import Html.Events exposing (onClick)
import Html.App as Html
import Board exposing (Board, Mark(..), new)
import UI exposing (Msg(..), GameType(..), showBoard, showReset, showGameState)
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
    SelectGameType HvH ->
      {playState = InProgress (Game.new (Board.new 3))}
    SelectGameType HvC ->
      {playState = InProgress (Game.new (Board.new 3))}
    TakeTurn position ->
      case model.playState of
        InProgress game -> {playState = InProgress (takeTurn position game)}
        NotStarted -> {playState = NotStarted}
    _ -> {playState = NotStarted }


-- VIEW

view : Model -> Html Msg
view model =
  case model.playState of
    NotStarted -> div [] [
      button [onClick (SelectGameType HvH)] [text "Human vs Human"],
      button [onClick (SelectGameType HvC)] [text "Human vs Computer"]
      ]
    InProgress model -> div [] [
      h1 [] [ text "Tic Tac Toe" ],
      showGameState model,
      showBoard model,
      showReset
    ]
