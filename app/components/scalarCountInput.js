import React from 'react'
import {connect} from 'react-redux'

const mapStateToProps = state => ({scalarCount: state.get('scalarCount')})

const mapDispatchToProps = dispatch => {
	return {
		onChange: event => dispatch(
			{type: 'SET_SCALAR_INPUT_COUNT', data: event.target.value}
		)
	}
}

export default connect(mapStateToProps, mapDispatchToProps)(
	({scalarCount, onChange}) => (
		<div>
			How many scalars?
			<input
			{...{id: 'scalar-count-input', value: scalarCount, onChange}}
			/>
		</div>
	)
)