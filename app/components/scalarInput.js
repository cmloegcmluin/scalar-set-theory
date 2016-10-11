import React from 'react'
import {connect} from 'react-redux'

const mapStateToProps = (state, ownProps) => {
	return {
		value: state.get('scalarSet').toArray()[ownProps.index] || 0,
		index: ownProps.index
	}
}

const mapDispatchToProps = dispatch => {
	return {
		handleChange: (event, index) => dispatch(
			{type: 'UPDATE_SCALAR', data: {index: index, val: event.target.value}}
		)
	}
}

export default connect(mapStateToProps, mapDispatchToProps)(
	({value, index, handleChange}) => (
		<input 
			value={value}
			onChange={event => {handleChange(event, index)}}
		/>
	)
)