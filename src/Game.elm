module Game exposing (Game, new, takeTurn)

import Board exposing (Board, Mark(..), mark)

type alias Game = {board : Board, currentPlayer : Mark}

new : Board -> Game
new board = 
  {board = board, currentPlayer = X}


takeTurn : Int -> Game -> Game
takeTurn position game = 
  {game | board = mark position game.currentPlayer game.board,
          currentPlayer = opponent game.currentPlayer }


opponent : Mark -> Mark
opponent mark = 
  case mark of
    X -> O
    O -> X
