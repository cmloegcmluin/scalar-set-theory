import React from 'react'
import NormalOrderCounter from './normalOrderCounter'
import ScalarCountInput from './scalarCountInput'
import ScalarInputs from './scalarInputs'

export default ({state}) => (
	<div>
		How many scalars? <ScalarCountInput state={state}/>
		<ScalarInputs 
			state={state} 
			scalarInputCount={state.getState().scalarInputCount}
		/>
		<NormalOrderCounter scalarSet={state.getState().scalarSet}/>
	</div>
)