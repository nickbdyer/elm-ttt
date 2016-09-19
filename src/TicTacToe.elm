module TicTacToe exposing (..)

import Html exposing (Html, div, h1, text)
import Html.App as Html
import Board exposing (Board, Mark(..), new)
import UI exposing (Msg(..), showBoard, showReset, showGameState)
import Game exposing (Game, takeTurn)

main =
  Html.beginnerProgram { model = initialModel, update = update, view = view }

-- MODEL

type alias Model = Game

initialModel : Model
initialModel =
  Game.new (Board.new 3)


-- UPDATE

update : Msg -> Model -> Model
update msg model =
  case msg of
    TakeTurn position ->
      takeTurn position model
    Reset ->
      initialModel


-- VIEW

view : Model -> Html Msg
view model =
  div [] [
    h1 [] [ text "Tic Tac Toe" ],
    showGameState model,
    showBoard model,
    showReset
  ]
