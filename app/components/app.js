import React from 'react'

import ScalarCountInputContainer from '../containers/scalarCountInputContainer'
import ScalarInputs from './scalarInputs'
import NormalOrderCounterContainer from '../containers/normalOrderCounterContainer'

export default () => (
	<div>
		<ScalarCountInputContainer/>
		<ScalarInputs/>
		<NormalOrderCounterContainer/>
	</div>
)