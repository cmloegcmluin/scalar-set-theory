module ScalarSetTheory.Analyses.AnalysisValueStep exposing (AnalysisValuePath, AnalysisValueStep, findAnalysisValueStepInPath)

import ScalarSetTheory.Analyses.Analysis exposing (Analysis)
import ScalarSetTheory.Utilities exposing (find)


type alias AnalysisValueStep =
    { analysis : Analysis
    , value : String
    }


type alias AnalysisValuePath =
    List AnalysisValueStep


findAnalysisValueStepInPath : Analysis -> AnalysisValuePath -> Maybe AnalysisValueStep
findAnalysisValueStepInPath analysis analysisValuePath =
    find (\analysisValueStep -> analysisValueStepIsForAnalysis analysisValueStep analysis) analysisValuePath


analysisValueStepIsForAnalysis : AnalysisValueStep -> Analysis -> Bool
analysisValueStepIsForAnalysis analysisValueStep analysis =
    analysisValueStep.analysis == analysis
