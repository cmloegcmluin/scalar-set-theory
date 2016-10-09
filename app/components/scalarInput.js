import React from 'react'

export default ({state, index}) => (
	<input 
		value={state.getState().scalarSet[index] || 0}
		onChange={event => state.dispatch(
			{type: 'UPDATE_SCALAR', data: {index: index, val: event.target.value}}
		)}
	/>
)