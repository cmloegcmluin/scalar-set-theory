module ScalarSetTheory.Analyses.NChord exposing (nChordsWithinAnalysisValuePath)

import List exposing (map, range)
import ScalarSetTheory.Analyses.Analysis exposing (Analysis(EqualDivision))
import ScalarSetTheory.Analyses.AnalysisChildrenValuesGetter exposing (AnalysisChildrenValuesGetter)
import ScalarSetTheory.Analyses.AnalysisValueStep exposing (findAnalysisValueStepInPath)
import ScalarSetTheory.Utilities exposing (parseInt)


nChordsWithinAnalysisValuePath : AnalysisChildrenValuesGetter
nChordsWithinAnalysisValuePath analysisValuePath nChordSetting =
    let
        nChordMin =
            nChordSetting.min

        nChordMax =
            nChordSetting.max

        -- and eventually other section values and their effects on the values for nChords here
        edValue =
            case findAnalysisValueStepInPath EqualDivision analysisValuePath of
                Just edAnalysisValueStep ->
                    parseInt edAnalysisValueStep.value

                Nothing ->
                    99999

        childValuesMin =
            nChordMin

        childValuesMax =
            min edValue nChordMax

        childValues =
            range childValuesMin childValuesMax
    in
    map toString childValues
