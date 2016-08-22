module Game exposing (..)

import Board exposing (Board, Mark(..))

type alias Game = {board : Board, currentPlayer : Mark}

new : Board -> Game
new board = 
  {board = board, currentPlayer = X}


takeTurn : Game -> Game
takeTurn game = 
  {game | currentPlayer = O }
