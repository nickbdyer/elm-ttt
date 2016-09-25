module Game exposing (..)

import Board exposing (Board, BoardState(..), Mark(..), state, mark, full, winner)

type alias Game = {board : Board, currentPlayer : Mark}

type GameType = HvH | HvC | CvH | CvC


new : Board -> Game
new board =
  {board = board, currentPlayer = X}


takeTurn : Maybe Int -> Game -> Game
takeTurn position game =
  let
    tuple = (,) position (state (board game))
  in
    case tuple of
      (Just a, Ongoing) -> {game | board = mark a (currentPlayer game) (board game),
                                  currentPlayer = opponent (currentPlayer game) }
      _ -> game

opponent : Mark -> Mark
opponent mark =
  case mark of
    X -> O
    O -> X


currentPlayer : Game -> Mark
currentPlayer game =
  game.currentPlayer


board : Game -> Board
board game =
  game.board
