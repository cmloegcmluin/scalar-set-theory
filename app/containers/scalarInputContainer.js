import {connect} from 'react-redux'
import classnames from 'classnames'

import ScalarInput from '../components/scalarInput'

const mapStateToProps = (state, ownProps) => {
	const index = ownProps.index
	const value = state.get('scalarSet').toArray()[index] || ''
	const className = classnames("scalar-input-" + index, "scalar-input")
	return {...{value, index, className}}
}

const mapDispatchToProps = dispatch => ({
	onChange: (val, index) => dispatch({
		type: 'UPDATE_SCALAR', 
		data: {...{val, index}}
	})
})

export default connect(mapStateToProps, mapDispatchToProps)(ScalarInput)