module LinesTest exposing (..)

import Test exposing (..)
import Expect

import Lines exposing (..)
import Board exposing (Board, Mark(..), new)
import Array exposing (repeat, fromList)
import TestHelpers exposing (createDrawBoard)


all : Test
all =
    describe "Lines Test"
        [ test "A board can be split into rows" <|
            \() ->
              createDrawBoard
                |> getRows
                |> Expect.equal (fromList [ fromList [Just X, Just X, Just O] 
                                          , fromList [Just O, Just O, Just X]
                                          , fromList [Just X, Just O, Just X] ])

        , test "A board can be split into columns" <|
            \() ->
              createDrawBoard
                |> getColumns
                |> Expect.equal (fromList [ fromList [Just X, Just O, Just X] 
                                          , fromList [Just X, Just O, Just O]
                                          , fromList [Just O, Just X, Just X] ])

        , test "A board can be split into diagonals" <|
            \() ->
              createDrawBoard
                |> getDiagonals
                |> Expect.equal (fromList [ fromList [Just X, Just O, Just X] 
                                          , fromList [Just O, Just O, Just X] ])
        ]

