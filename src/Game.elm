module Game exposing (Game, GameState(..), new, takeTurn, retrieveState)

import Board exposing (Board, Mark(..), mark, full, winner)

type alias Game = {board : Board, currentPlayer : Mark}

type GameState = Winner Mark | Draw | InPlay

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


retrieveState : Game -> GameState
retrieveState game =
  let
    situation = (winner game.board, full game.board)
  in
    case situation of
      (Just symbol, _) -> Winner symbol
      (Nothing, True) -> Draw
      (Nothing, False) -> InPlay

