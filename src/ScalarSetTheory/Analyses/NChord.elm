module ScalarSetTheory.Analyses.NChord exposing (nChordsWithinAnalysisValuePath)

import List exposing (foldr, map, range)
import ScalarSetTheory.Analyses.Analysis exposing (..)
import ScalarSetTheory.Analyses.AnalysisChildrenValues exposing (AnalysisChildrenValues)
import ScalarSetTheory.Analyses.AnalysisValueStep exposing (AnalysisValuePath, findAnalysisValueStepInPath)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Utilities exposing (parseInt)


nChordsWithinAnalysisValuePath : AnalysisChildrenValues
nChordsWithinAnalysisValuePath analysisValuePath nChordSetting =
    let
        nChordMin =
            nChordSetting.min

        nChordMax =
            nChordSetting.max

        edValue =
            case findAnalysisValueStepInPath EqualDivision analysisValuePath of
                Just edAnalysisValueStep ->
                    parseInt edAnalysisValueStep.value

                Nothing ->
                    99999
    in
    map toString (range nChordMin (min edValue nChordMax))
