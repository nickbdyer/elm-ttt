module TicTacToeTest exposing (..)

import TicTacToe exposing (..)
import ElmTest exposing (..)

tests =
  suite "TicTacToe Test"
    [ 
      test 
      "" 
      <| assertEqual 2 (1 + 1)

    ]


main : Program Never
main =
  runSuite tests

