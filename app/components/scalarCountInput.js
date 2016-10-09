import React from 'react'

export default ({store}) => (
	<input onChange={event => store.dispatch({type: 'SET_COUNT', data: event.target.value})}/>
)