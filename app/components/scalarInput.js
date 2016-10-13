import React from 'react'
import {connect} from 'react-redux'
import classnames from 'classnames'

const mapStateToProps = (state, ownProps) => {
	const index = ownProps.index
	const value = state.get('scalarSet').toArray()[index] || ''
	const className = classnames("scalar-input-" + index, "scalar-input")
	return {...{value, index, className}}
}

const mapDispatchToProps = dispatch => {
	return {
		onChange: (event, index) => dispatch(
			{type: 'UPDATE_SCALAR', data: {
				index: index, val: event.target.value
			}}
		)
	}
}

export default connect(mapStateToProps, mapDispatchToProps)(
	({value, index, onChange, className}) => (
		<input
			{...{value, className, onChange: event => {onChange(event, index)}}}
		/>
	)
)