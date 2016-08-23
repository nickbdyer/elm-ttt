module TicTacToe exposing (..)

import Html exposing (Html, div, h1, text)
import Html.App as Html
import Board exposing (Board, Mark(..), new)
import UI exposing (Msg(..), showBoard, showReset)
import Array exposing (initialize)
import Game exposing (Game, new, takeTurn)

main = 
  Html.beginnerProgram { model = model, update = update, view = view }

-- MODEL

type alias Model = Game
 
model : Model
model = 
  Game.new (Board.new 9)

-- UPDATE


update : Msg -> Model -> Model
update msg model = 
  case msg of 
    Mark position -> 
      takeTurn position model
    Reset -> 
      Game.new (Board.new 9)
      

-- VIEW


view : Model -> Html Msg
view model = 
  div [] [
    h1 [] [ text "Tic Tac Toe" ],
    showBoard model.board,
    showReset
  ]

