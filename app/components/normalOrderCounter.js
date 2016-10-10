import React from 'react'
import {connect} from 'react-redux'

import normalOrderCount from '../lib/normalOrderCount'

const mapStateToProps = state => (state)

export default connect(mapStateToProps)(
	({scalarSet}) => (
		<div>Normal order count: {normalOrderCount(scalarSet)}</div>
	)
)