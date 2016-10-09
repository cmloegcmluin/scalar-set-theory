import React from 'react'
import ScalarInput from './scalarInput'
import range from '../helpers/range'

export default ({scalarCount, state}) => (
	<div>
		{range(scalarCount).map(
			input => <ScalarInput state={state} index={input} key={input}/>
		)}
	</div>
)