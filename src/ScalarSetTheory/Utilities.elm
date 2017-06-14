module ScalarSetTheory.Utilities exposing (parseInt)


parseInt : String -> Int
parseInt string =
    String.toInt string |> Result.toMaybe |> Maybe.withDefault 0
