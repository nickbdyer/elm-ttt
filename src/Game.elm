module Game exposing (new, takeTurn)

import Board exposing (Board, Mark(..))

type alias Game = {board : Board, currentPlayer : Mark}

new : Board -> Game
new board = 
  {board = board, currentPlayer = X}


takeTurn : Game -> Game
takeTurn game = 
  {game | currentPlayer = opponent game.currentPlayer }


opponent : Mark -> Mark
opponent mark = 
  case mark of
    X -> O
    O -> X
