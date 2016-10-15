import React from 'react'

import ScalarInputContainer from '../containers/scalarInputContainer'
import range from '../helpers/range'

export default ({scalarCount}) => (
	<div>
		{range(scalarCount).map(
			index => <ScalarInputContainer {...{index, key: index}}/>
		)}
	</div>
)