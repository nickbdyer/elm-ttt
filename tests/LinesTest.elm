module LinesTest exposing (..)

import Test exposing (..)
import Expect

import Lines exposing (..)
import Board exposing (Board, Mark(..), new)
import Array exposing (repeat, fromList)
import BoardTest exposing (createFullBoard)


all : Test
all =
    describe "Lines Test"
        [ test "A board can be split into rows" <|
            \() ->
              createFullBoard
                |> getRows
                |> Expect.equal (fromList [ fromList [Just X, Just O, Just O] 
                                          , fromList [Just O, Just X, Just X]
                                          , fromList [Just X, Just O, Just X] ])

        , test "A board can be split into columns" <|
            \() ->
              createFullBoard
                |> getColumns
                |> Expect.equal (fromList [ fromList [Just X, Just O, Just X] 
                                          , fromList [Just O, Just X, Just O]
                                          , fromList [Just O, Just X, Just X] ])
        ]
