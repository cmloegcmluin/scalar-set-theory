module ScalarSetTheoryTests.UpdateTests exposing (updateTests)

import Expect exposing (equal)
import Html exposing (text)
import ScalarSetTheory.Msg exposing (..)
import ScalarSetTheory.Types.TableNode exposing (TableNode(TableNode))
import ScalarSetTheory.Update exposing (update)
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
                        , activeSections = [ "ed", "nChord" ]
                        }

                    actual =
                        update
                            (UpdateSectionMin "5" "ed")
                            { ed = { min = "7", max = "7" }
                            , nChord = { min = "4", max = "6" }
                            , activeSections = [ "ed", "nChord" ]
                            }
                in
                equal expected actual
        , test "UpdateSectionMax updates the max for the correct section" <|
            \() ->
                let
                    expected =
                        { ed = { min = "5", max = "7" }
                        , nChord = { min = "4", max = "8" }
                        , activeSections = [ "ed", "nChord" ]
                        }

                    actual =
                        update
                            (UpdateSectionMax "8" "nChord")
                            { ed = { min = "5", max = "7" }
                            , nChord = { min = "4", max = "6" }
                            , activeSections = [ "ed", "nChord" ]
                            }
                in
                equal expected actual
        ]
