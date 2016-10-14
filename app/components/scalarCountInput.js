import React from 'react'
import {connect} from 'react-redux'

const mapStateToProps = state => ({
	scalarCountDisplay: state.get('scalarCountDisplay')
})

const mapDispatchToProps = dispatch => ({
	onChange: event => dispatch({
		type: 'SET_SCALAR_INPUT_COUNT', data: event.target.value
	})
})

export default connect(mapStateToProps, mapDispatchToProps)(
	({scalarCountDisplay, onChange}) => (
		<div>
			How many scalars?
			<input {...{
					id: 'scalar-count-input', 
					type: 'number', 
					value: scalarCountDisplay, 
					onChange
			}}/>
		</div>
	)
)