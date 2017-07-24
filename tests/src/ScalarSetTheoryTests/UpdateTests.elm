module ScalarSetTheoryTests.UpdateTests exposing (updateTests)

import Expect exposing (equal)
import Html exposing (text)
import ScalarSetTheory.Msg exposing (..)
import ScalarSetTheory.Sections.Sections exposing (..)
import ScalarSetTheory.TableNode.TableNode exposing (TableNode(TableNode))
import ScalarSetTheory.Update exposing (update)
import Test exposing (Test, describe, test)


updateTests : Test
updateTests =
    describe "update" []



--        [ test "UpdateSectionMin updates the min for the correct section" <|
--            \() ->
--                let
--                    expected =
--                        { ed = { min = 5, max = 7 }
--                        , nChord = { min = 4, max = 6 }
--                        , activeSections = [ Ed, NChord ]
--                        }
--
--                    actual =
--                        update
--                            (UpdateSectionMin 5 Ed)
--                            { ed = { min = 7, max = 7 }
--                            , nChord = { min = 4, max = 6 }
--                            , activeSections = [ Ed, NChord ]
--                            }
--                in
--                equal expected actual
--        , test "UpdateSectionMax updates the max for the correct section" <|
--            \() ->
--                let
--                    expected =
--                        { ed = { min = 5, max = 7 }
--                        , nChord = { min = 4, max = 8 }
--                        , activeSections = [ Ed, NChord ]
--                        }
--
--                    actual =
--                        update
--                            (UpdateSectionMax 8 NChord)
--                            { ed = { min = 5, max = 7 }
--                            , nChord = { min = 4, max = 6 }
--                            , activeSections = [ Ed, NChord ]
--                            }
--                in
--                equal expected actual
--        ]
