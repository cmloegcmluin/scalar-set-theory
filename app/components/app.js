import React from 'react'

import ScalarCountInputContainer from '../containers/scalarCountInputContainer'
import ScalarInputsContainer from '../containers/scalarInputsContainer'
import NormalOrderCounterContainer from '../containers/normalOrderCounterContainer'

export default () => (
	<div>
		<ScalarCountInputContainer/>
		<ScalarInputsContainer/>
		<NormalOrderCounterContainer/>
	</div>
)