module UITest exposing (..)

import Test exposing (..)
import Expect
import Html exposing (Html, div, text, button)
import Html.Events exposing (onClick)

import Board exposing (new)
import UI exposing (showBoard, Msg(..))


all : Test
all =
    describe "UI Test"
        [test "UI can display the board" <|
          \() -> 
            showBoard (Board.new 9)
              |> Expect.equal (div [] [
                div [] [
                  button [onClick Mark] [text ""],
                  button [onClick Mark] [text ""],
                  button [onClick Mark] [text ""]
                  ]
                  , div [] [
                  button [onClick Mark] [text ""],
                  button [onClick Mark] [text ""],
                  button [onClick Mark] [text ""]
                  ]
                  , div [] [
                  button [onClick Mark] [text ""],
                  button [onClick Mark] [text ""],
                  button [onClick Mark] [text ""]
                  ]
               ])
        ]


