import React from 'react'

export default ({state}) => (
	<input 
		value={state.getState().scalarInputCount} 
		onChange={event => state.dispatch(
			{type: 'SET_SCALAR_INPUT_COUNT', data: event.target.value}
		)}
	/>
)