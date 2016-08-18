module TicTacToe exposing (..)

import Html exposing (Html, div, h1, text)
import Html.App as Html
import Board exposing (Board, new, mark)
import UI exposing (showBoard)
import Array exposing (initialize)

main = 
  Html.beginnerProgram { model = model, update = update, view = view }

-- MODEL

type alias Model = Board
 
model : Model
model = 
  Board.new 9

-- UPDATE

type Msg = Mark

update : Msg -> Model -> Model
update msg model = 
  case msg of 
    Mark -> 
      Board.new 9

-- VIEW


view : Model -> Html Msg
view model = 
  div [] [
    h1 [] [ text "Tic Tac Toe" ],
    showBoard model
  ]

