import React from 'react'
import {connect} from 'react-redux'

import elementCount from '../helpers/elementCount'
import normalOrderCount from '../lib/normalOrderCount'

const mapStateToProps = state => ({
	scalarSet: state.get('scalarSet').toArray().filter(el => el !== undefined)
})

export default connect(mapStateToProps)(
	({scalarSet}) => (
		<div id="normal-order-count">Normal order count: {
			elementCount(scalarSet) ? normalOrderCount(scalarSet) : 0
		}</div>
	)
)