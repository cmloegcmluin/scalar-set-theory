import React from 'react'
import normalOrderCount from '../lib/normalOrderCount'

export default ({scalarSet}) => (
	<div>Normal order count: {normalOrderCount(scalarSet)}</div>
)