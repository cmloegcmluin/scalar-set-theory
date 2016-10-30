import {connect} from 'react-redux'
import classnames from 'classnames'

import ScalarInput from '../components/scalarInput'
import updateNormalOrders from '../actions/updateNormalOrders'

const mapStateToProps = (state, ownProps) => {
	const index = ownProps.index
	const scalarSet = state.get('scalarSet')
	const value = scalarSet.toArray()[index] || ''
	const className = classnames('scalar-input-' + index, 'scalar-input')
	return {...{value, index, className, scalarSet}}
}

const mapDispatchToProps = dispatch => ({
	onChange: (val, index, scalarSet) => {
		val = parseInt(val) || 0
		const newScalarSet = scalarSet.set(index, val)
		dispatch({type: 'UPDATE_SCALAR', data: newScalarSet})
		updateNormalOrders(dispatch, newScalarSet.toArray())
	}
})

export default connect(mapStateToProps, mapDispatchToProps)(ScalarInput)