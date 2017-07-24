module ScalarSetTheory.Utilities exposing (inclusiveCount, parseInt)

import Maybe exposing (withDefault)
import Result exposing (toMaybe)
import String exposing (toInt)


parseInt : String -> Int
parseInt string =
    toInt string |> toMaybe |> withDefault 0


inclusiveCount : Int -> Int -> Int
inclusiveCount min max =
    1 + max - min
