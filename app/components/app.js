import React from 'react'

import ScalarCountInputContainer from '../containers/scalarCountInputContainer'
import ScalarInputsContainer from '../containers/scalarInputsContainer'
import NormalOrderCounterContainer from '../containers/normalOrderCounterContainer'
import NormalOrdersContainer from '../containers/normalOrdersContainer'

export default () => (
	<div>
		<ScalarCountInputContainer />
		<ScalarInputsContainer />
		<NormalOrderCounterContainer />
		<NormalOrdersContainer />
	</div>
)