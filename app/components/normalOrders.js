import React from 'react'
import {List} from 'immutable'

import normalOrdersList from '../lib/normalOrdersList'
import getScalarNames from '../lib/scalarNames'

const calcRenderNormalOrders = scalarSet => {
	const scalarNames = List(getScalarNames(scalarSet.length)).reverse().toArray()
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