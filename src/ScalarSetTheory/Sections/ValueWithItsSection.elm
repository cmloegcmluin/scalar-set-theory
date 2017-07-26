module ScalarSetTheory.Sections.ValueWithItsSection exposing (ValueWithItsSection, ValueWithItsSectionFilters, getValueWithItsSectionFromValuesAndTheirSectionsByItsSection)

import ScalarSetTheory.Sections.Section exposing (..)
import ScalarSetTheory.Utilities exposing (find)


type alias ValueWithItsSection =
    { section : Section
    , value : String
    }



-- the section is different in each one of these


type alias ValueWithItsSectionFilters =
    List ValueWithItsSection



-- the section is the same in all of these


type alias ValueWithItsSectionChildren =
    List ValueWithItsSection


getValueWithItsSectionFromValuesAndTheirSectionsByItsSection : Section -> ValueWithItsSectionFilters -> Maybe ValueWithItsSection
getValueWithItsSectionFromValuesAndTheirSectionsByItsSection section valuesWithTheirSections =
    find (\valueWithItsSection -> valueWithItsSectionIsForSection valueWithItsSection section) valuesWithTheirSections


valueWithItsSectionIsForSection : ValueWithItsSection -> Section -> Bool
valueWithItsSectionIsForSection valueWithItsSection section =
    valueWithItsSection.section == section
