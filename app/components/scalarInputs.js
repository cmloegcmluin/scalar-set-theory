import React from 'react'

import ScalarInputContainer from '../containers/scalarInputContainer'
import range from '../helpers/range'

import scalarName from '../lib/scalarName'

export default ({scalarCount}) => (
	<div>
		{range(scalarCount).map(index =>
			<ScalarInputContainer {...{
				index,
				key: index,
				name: scalarName(index, scalarCount)
			}}/>
		)}
	</div>
)