module ScalarSetTheory.Analyses.AnalysisDefaults exposing (defaultAnalysisSettings)

import ScalarSetTheory.Analyses.Analysis exposing (..)
import ScalarSetTheory.Analyses.AnalysisProperties exposing (getAnalysisProperties)
import ScalarSetTheory.Analyses.AnalysisSettings exposing (AnalysisSetting, AnalysisSettings)


defaultAnalysisSettings : AnalysisSettings
defaultAnalysisSettings =
    let
        equalDivisionProperites =
            getAnalysisProperties EqualDivision

        nChordProperties =
            getAnalysisProperties NChord
    in
    [ AnalysisSetting EqualDivision equalDivisionProperites.initialMin equalDivisionProperites.initialMax
    , AnalysisSetting NChord nChordProperties.initialMin nChordProperties.initialMax
    ]
