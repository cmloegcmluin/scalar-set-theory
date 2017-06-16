module ScalarSetTheoryTests.UpdateTests exposing (updateTests)

import Expect exposing (equal)
import ScalarSetTheory.Update exposing (..)
import Test exposing (Test, describe, test)


updateTests : Test
updateTests =
    describe "update"
        [ test "UpdateSectionMin updates the min for the correct section" <|
            \() ->
                let
                    expected =
                        { ed = { min = "5", max = "7" }
                        , nChord = { min = "4", max = "6" }
                        , activeSections = [ "ed" ]
                        }

                    actual =
                        update
                            (UpdateSectionMin "5" "ed")
                            { ed = { min = "7", max = "7" }
                            , nChord = { min = "4", max = "6" }
                            , activeSections = [ "ed" ]
                            }
                in
                equal expected actual
        , test "UpdateSectionMax updates the max for the correct section" <|
            \() ->
                let
                    expected =
                        { ed = { min = "5", max = "7" }
                        , nChord = { min = "4", max = "8" }
                        , activeSections = [ "ed" ]
                        }

                    actual =
                        update
                            (UpdateSectionMax "8" "nChord")
                            { ed = { min = "5", max = "7" }
                            , nChord = { min = "4", max = "6" }
                            , activeSections = [ "ed" ]
                            }
                in
                equal expected actual
        ]
