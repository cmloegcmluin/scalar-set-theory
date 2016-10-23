import React from 'react'

import normalOrdersList from '../lib/normalOrdersList'

export default ({scalarSet}) => (
	<div {...{className: 'normal-orders'}}>
		{normalOrdersList(scalarSet)}
	</div>
)