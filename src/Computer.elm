module Computer exposing (..)

import Board exposing (Board, Mark(..), BoardState(..), toArray, empty, state)
import Game exposing (Game, opponent)
import Array exposing (..)


chooseMove : Game -> Maybe Int
chooseMove game =
  let
    board = game.board
    indexedBoard = Array.indexedMap (,) (toArray board)
    availableMoves = Array.filter (\elem -> snd elem == Nothing) indexedBoard
  in
    case (get 0 availableMoves) of
     Just (a, b) -> Just a
     Nothing -> Nothing


perfectMove : Game -> Maybe Int
perfectMove game =
  let
    board = Game.board game
    player = Game.currentPlayer game
  in
    if Board.empty board then Just 0 else Just (snd (bestMove board player))


bestMove : Board -> Mark -> (Int, Int)
bestMove board player =
  let
    availableMoves = possible_moves board
    scoreMoves = Array.map (\move -> score_move board player move) availableMoves
    bestMove = Array.foldl (\(score, place) (best_score, best_place) ->
      if score > best_score then (score, place) else (best_score, best_place)) (-100, -1) scoreMoves
  in
    bestMove


score_move : Board -> Mark -> Int -> (Int, Int)
score_move board player place =
  let
      next_board = Board.mark place player board
      scoredMove = score next_board
  in
      case (state next_board) of
        Draw -> (0, place)
        Ongoing -> (-(opponentScore next_board player), place)
        Winner x -> if x == player then (scoredMove, place) else (-scoredMove, place)


opponentScore : Board -> Mark -> Int
opponentScore board player =
  let
    (score, _) = bestMove board (opponent player)
  in
    score


score : Board -> Int
score board =
  Array.length (possible_moves board) + 50


possible_moves : Board -> Array Int
possible_moves board =
  Array.indexedMap (,) (toArray board)
    |> Array.filter (\elem -> snd elem == Nothing)
    |> Array.map (\elem -> fst elem)
