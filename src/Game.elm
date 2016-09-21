module Game exposing (..)

import Board exposing (Board, Mark(..), mark, full, winner)

type alias Game = {board : Board, currentPlayer : Mark}

type GameState = Winner Mark | Draw | InPlay


new : Board -> Game
new board =
  {board = board, currentPlayer = X}


takeTurn : Int -> Game -> Game
takeTurn position game =
  {game | board = mark position (currentPlayer game) (board game),
          currentPlayer = opponent (currentPlayer game) }


opponent : Mark -> Mark
opponent mark =
  case mark of
    X -> O
    O -> X


retrieveState : Game -> GameState
retrieveState game =
  let
    situation = (winner (board game), full (board game))
  in
    case situation of
      (Just symbol, _) -> Winner symbol
      (Nothing, True) -> Draw
      (Nothing, False) -> InPlay


currentPlayer : Game -> Mark
currentPlayer game =
  game.currentPlayer


board : Game -> Board
board game =
  game.board
