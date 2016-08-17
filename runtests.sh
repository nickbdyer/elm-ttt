#!/bin/sh
elm-make tests/TicTacToeTest.elm --yes --output tests.js && node tests.js


