import React from 'react'
import NormalOrderCounter from './normalOrderCounter'
import ScalarCountInput from './scalarCountInput'
import ScalarInputs from './scalarInputs'

export default ({store}) => (
	<div>
		How many scalars? <ScalarCountInput store={store}/>
		<ScalarInputs store={store} scalarInputCount={store.getState().scalarInputCount}/>
		<NormalOrderCounter scalarSet={[20, 20]}/>
	</div>
)