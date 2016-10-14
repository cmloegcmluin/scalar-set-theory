import React from 'react'

import ScalarCountInput from './scalarCountInput'
import ScalarInputs from './scalarInputs'
import NormalOrderCounterContainer from '../containers/normalOrderCounterContainer'

export default () => (
	<div>
		<ScalarCountInput/>
		<ScalarInputs/>
		<NormalOrderCounterContainer/>
	</div>
)