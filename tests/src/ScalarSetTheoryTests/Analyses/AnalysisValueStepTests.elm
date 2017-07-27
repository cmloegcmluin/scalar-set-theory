module ScalarSetTheoryTests.Analyses.AnalysisValueStepTests exposing (analysisValueStepTests)

import Expect exposing (equal)
import ScalarSetTheory.Analyses.Analysis exposing (Analysis(EqualDivision, NChord))
import ScalarSetTheory.Analyses.AnalysisValueStep exposing (AnalysisValueStep, findAnalysisValueStepInPath)
import Test exposing (Test, describe, test)


analysisValueStepTests : Test
analysisValueStepTests =
    describe "analysis value step tests"
        [ test "when the anlysis value path contains a step with the sought analysis, returns that step" <|
            \() ->
                let
                    expected =
                        Just (AnalysisValueStep EqualDivision "76")

                    analysisValuePath =
                        [ AnalysisValueStep NChord "66"
                        , AnalysisValueStep EqualDivision "76"
                        ]

                    actual =
                        findAnalysisValueStepInPath EqualDivision analysisValuePath
                in
                equal expected actual
        , test "find analysis value path does not contain a step with the sought analysis, returns nothing" <|
            \() ->
                let
                    expected =
                        Nothing

                    analysisValuePath =
                        [ AnalysisValueStep NChord "66"
                        ]

                    actual =
                        findAnalysisValueStepInPath EqualDivision analysisValuePath
                in
                equal expected actual
        ]
