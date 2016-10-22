import React from 'react'

import ScalarCountInputContainer from '../containers/scalarCountInputContainer'
import ScalarInputsContainer from '../containers/scalarInputsContainer'
import NormalOrderCounterContainer from '../containers/normalOrderCounterContainer'
import NormalOrders from './normalOrders'

export default () => (
	<div>
		<ScalarCountInputContainer />
		<ScalarInputsContainer />
		<NormalOrderCounterContainer />
		<NormalOrders />
	</div>
)