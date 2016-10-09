import React from 'react'
import ScalarInput from './scalarInput'
import range from '../lib/range'

export default ({scalarInputCount, state}) => (
	<div>
		{range(scalarInputCount).map(
			input => <ScalarInput state={state} index={input} key={input}/>
		)}
	</div>
)