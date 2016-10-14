import React from 'react'

import normalOrderCount from '../lib/normalOrderCount'
import elementCount from '../helpers/elementCount'

export default ({scalarSet}) => (
	<div id="normal-order-count">
		<div>Normal order count:</div>
		<div>{elementCount(scalarSet) ? normalOrderCount(scalarSet) : 0}</div>
	</div>
)