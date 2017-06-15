module ScalarSetTheoryTests.UpdateTests exposing (updateTests)

import Expect exposing (equal)
import ScalarSetTheory.Update exposing (..)
import Test exposing (Test, describe, test)


updateTests : Test
updateTests =
    describe "update"
        [ test "UpdateEdMin" <|
            \() ->
                let
                    expected =
                        { ed = { min = "5", max = "7" }
                        , nChord = { min = "4", max = "6" }
                        , sections = [ "ed" ]
                        }

                    actual =
                        update
                            (UpdateEdMin "5")
                            { ed = { min = "7", max = "7" }
                            , nChord = { min = "4", max = "6" }
                            , sections = [ "ed" ]
                            }
                in
                equal expected actual
        , test "UpdateEdMax" <|
            \() ->
                let
                    expected =
                        { ed = { min = "5", max = "11" }
                        , nChord = { min = "4", max = "6" }
                        , sections = [ "ed" ]
                        }

                    actual =
                        update
                            (UpdateEdMax "11")
                            { ed = { min = "5", max = "7" }
                            , nChord = { min = "4", max = "6" }
                            , sections = [ "ed" ]
                            }
                in
                equal expected actual
        , test "UpdateNChordMin" <|
            \() ->
                let
                    expected =
                        { ed = { min = "5", max = "7" }
                        , nChord = { min = "3", max = "6" }
                        , sections = [ "ed" ]
                        }

                    actual =
                        update
                            (UpdateNChordMin "3")
                            { ed = { min = "5", max = "7" }
                            , nChord = { min = "4", max = "6" }
                            , sections = [ "ed" ]
                            }
                in
                equal expected actual
        , test "UpdateNChordMax" <|
            \() ->
                let
                    expected =
                        { ed = { min = "5", max = "7" }
                        , nChord = { min = "4", max = "8" }
                        , sections = [ "ed" ]
                        }

                    actual =
                        update
                            (UpdateNChordMax "8")
                            { ed = { min = "5", max = "7" }
                            , nChord = { min = "4", max = "6" }
                            , sections = [ "ed" ]
                            }
                in
                equal expected actual
        ]
