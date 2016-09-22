module Game exposing (..)

import Board exposing (Board, Mark(..), mark, full, winner)

type alias Game = {board : Board, currentPlayer : Mark}

type GameState = Winner Mark | Draw | InPlay
type GameType = HvH | HvC | CvH | CvC


new : Board -> Game
new board =
  {board = board, currentPlayer = X}


takeTurn : Maybe Int -> Game -> Game
takeTurn position game =
  let
    tuple = (,) position (retrieveState game)
  in
    case tuple of
      (Just a, InPlay) -> {game | board = mark a (currentPlayer game) (board game),
                                  currentPlayer = opponent (currentPlayer game) }
      _ -> game

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
