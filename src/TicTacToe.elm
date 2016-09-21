module TicTacToe exposing (..)

import Html exposing (Html, button, div, h1, text)
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
    TakeTurn position ->
      case model.playState of
        InProgress model -> {playState = InProgress (takeTurn position model)}
        NotStarted -> {playState = NotStarted}
    Reset ->
      {playState = NotStarted}


-- VIEW

view : Model -> Html Msg
view model =
  case model.playState of
    NotStarted -> div [] [
      button [] [text "Human vs Human"],
      button [] [text "Human vs Computer"]
      ]
    InProgress model -> div [] [
      h1 [] [ text "Tic Tac Toe" ],
      showGameState model,
      showBoard model,
      showReset
    ]
