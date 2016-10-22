import React from 'react'
import normalOrders from '../lib/normalOrders'

export default ({scalarSet}) => (
	<div>
		{normalOrders(scalarSet).map(
			normalOrder => <div>{normalOrder}</div>
		)}
	</div>
)