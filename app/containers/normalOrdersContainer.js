import {connect} from 'react-redux'

import NormalOrders from '../components/normalOrders'
import getScalarNames from '../lib/scalarNames'

const mapStateToProps = state => {
	let normalOrders = ''
	if (state.get('calculating')) {
		normalOrders = 'Loading...'
	} else {
		const scalarNames = getScalarNames(state.get('scalarSet').size)
		state.get('normalOrders').forEach(normalOrder => {
			normalOrder.forEach(char => normalOrders += scalarNames[char])
			normalOrders += ' '
		})
	}
	return {normalOrders}
}

export default connect(mapStateToProps)(NormalOrders)