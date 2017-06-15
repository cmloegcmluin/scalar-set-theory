module ScalarSetTheory.Utilities exposing (inclusiveCount, parseInt)


parseInt : String -> Int
parseInt string =
    String.toInt string |> Result.toMaybe |> Maybe.withDefault 0


inclusiveCount : Int -> Int -> Int
inclusiveCount min max =
    1 + max - min
