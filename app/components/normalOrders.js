import React from 'react'

import normalOrdersList from '../lib/normalOrdersList'
import getScalarNames from '../lib/scalarNames'

const calcRenderNormalOrders = scalarSet => {
	const scalarNames = getScalarNames(scalarSet.length)
	let output = ''
	normalOrdersList(scalarSet)
		.forEach(normalOrder => {
			normalOrder.forEach(char => output += scalarNames[char])
			output += ' '
		})
	return output
}

export default ({scalarSet}) => (
	<div {...{className: 'normal-orders'}}>
		{calcRenderNormalOrders(scalarSet)}
	</div>
)