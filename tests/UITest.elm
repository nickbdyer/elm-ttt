module UITest exposing (..)

import Test exposing (..)
import Expect
import Html exposing (Html, div, text, button)
import Html.Events exposing (onClick)
import Array exposing (fromList)

import Board exposing (Mark(..), new)
import UI exposing (sliceInRows, showBoard, Msg(..), getWidth)


all : Test
all =
    describe "UI Test"
        [ test "UI can display the board" <|
          \() -> 
            showBoard (Board.new 9)
              |> Expect.equal (div [] [
                div [] [
                  button [onClick (Mark 0)] [text ""],
                  button [onClick (Mark 1)] [text ""],
                  button [onClick (Mark 2)] [text ""]
                  ]
                  , div [] [
                  button [onClick (Mark 3)] [text ""],
                  button [onClick (Mark 4)] [text ""],
                  button [onClick (Mark 5)] [text ""]
                  ]
                  , div [] [
                  button [onClick (Mark 6)] [text ""],
                  button [onClick (Mark 7)] [text ""],
                  button [onClick (Mark 8)] [text ""]
                  ]
               ])

        , test "Cells with marks do not have onClick events" <|
          \() -> 
            let
                boardList = [Nothing, Nothing, Nothing, 
                             Just X, Just O, Just X, 
                             Nothing, Nothing, Nothing]
                board = fromList boardList
            in
              showBoard board               
              |> Expect.equal (div [] [
                div [] [
                  button [onClick (Mark 0)] [text ""],
                  button [onClick (Mark 1)] [text ""],
                  button [onClick (Mark 2)] [text ""]
                  ]
                  , div [] [
                  button [] [text "X"],
                  button [] [text "O"],
                  button [] [text "X"]
                  ]
                  , div [] [
                  button [onClick (Mark 6)] [text ""],
                  button [onClick (Mark 7)] [text ""],
                  button [onClick (Mark 8)] [text ""]
                  ]
               ])

        , test "Board can be cut as 2D a collection of rows" <|
            \() ->
              sliceInRows (Board.new 9)
                |> Expect.equal [ [ (0, Nothing)
                                  , (1, Nothing)
                                  , (2, Nothing)
                                  ], [
                                    (3, Nothing)
                                  , (4, Nothing)
                                  , (5, Nothing)
                                  ], [
                                    (6, Nothing)
                                  , (7, Nothing)
                                  , (8, Nothing) 
                                  ] 
                                ]

        , test "A board of size 9 has a display width of 3" <|
            \() ->
              getWidth (Board.new 9)
                |> Expect.equal 3

        , test "A board of size 16 has a display width of 4" <|
            \() ->
              getWidth (Board.new 16)
                |> Expect.equal 4
        ]


