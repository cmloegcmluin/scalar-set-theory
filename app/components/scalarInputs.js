import React from 'react'
import ScalarInput from './scalarInput'
import range from '../lib/range'

export default ({scalarInputCount, store}) => (
	<div>
		{range(scalarInputCount).map(input => <ScalarInput store={store} index={input} key={input}/>)}
	</div>
)