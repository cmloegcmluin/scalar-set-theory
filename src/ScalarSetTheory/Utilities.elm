module ScalarSetTheory.Utilities exposing (find, inclusiveCount, parseInt)

import Maybe exposing (withDefault)
import Result exposing (toMaybe)
import String exposing (toInt)


parseInt : String -> Int
parseInt string =
    toInt string |> toMaybe |> withDefault 0


inclusiveCount : Int -> Int -> Int
inclusiveCount min max =
    1 + max - min


find : (a -> Bool) -> List a -> Maybe a
find predicate list =
    case list of
        [] ->
            Nothing

        first :: rest ->
            if predicate first then
                Just first
            else
                find predicate rest
