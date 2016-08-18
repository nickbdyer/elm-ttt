module TicTacToe exposing (..)

import Html exposing (Html, div, h1, text)
import Html.App as Html

main = 
  Html.beginnerProgram { model = model, update = update, view = view }

-- MODEL

type alias Model = String 
 
model : Model
model = ""

-- UPDATE

type Msg = Reset

update : Msg -> Model -> Model
update msg model = 
  case msg of 
    Reset -> 
      ""

-- VIEW


view : Model -> Html Msg
view model = 
  h1 [] [ text "Tic Tac Toe" ]

