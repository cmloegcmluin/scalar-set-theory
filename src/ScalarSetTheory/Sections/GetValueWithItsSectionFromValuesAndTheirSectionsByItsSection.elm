module ScalarSetTheory.Sections.GetValueWithItsSectionFromValuesAndTheirSectionsByItsSection exposing (getValueWithItsSectionFromValuesAndTheirSectionsByItsSection)

import Maybe exposing (withDefault)
import ScalarSetTheory.Sections.Sections exposing (..)
import ScalarSetTheory.Utilities exposing (find)


getValueWithItsSectionFromValuesAndTheirSectionsByItsSection : Section -> List ValueWithItsSection -> Maybe ValueWithItsSection
getValueWithItsSectionFromValuesAndTheirSectionsByItsSection section valuesWithTheirSections =
    find (\valueWithItsSection -> valueWithItsSectionIsForSection valueWithItsSection section) valuesWithTheirSections


valueWithItsSectionIsForSection : ValueWithItsSection -> Section -> Bool
valueWithItsSectionIsForSection valueWithItsSection section =
    valueWithItsSection.section == section
