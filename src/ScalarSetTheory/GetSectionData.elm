module ScalarSetTheory.GetSectionData exposing (getSectionDataBySection)

import Maybe exposing (withDefault)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Sections exposing (..)


getSectionDataBySection : Section -> Model -> SectionData
getSectionDataBySection section model =
    withDefault (SectionData Ed 0 0) (find (\sectionData -> sectionDataIsSection sectionData section) model.sectionData)


sectionDataIsSection : SectionData -> Section -> Bool
sectionDataIsSection sectionData section =
    sectionData.section == section


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
