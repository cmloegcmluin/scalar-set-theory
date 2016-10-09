import React from 'react'

export default ({state}) => (
	<input
		id="scalarCountInput"
		value={state.getState().scalarCount} 
		onChange={event => state.dispatch(
			{type: 'SET_SCALAR_INPUT_COUNT', data: event.target.value}
		)}
	/>
)