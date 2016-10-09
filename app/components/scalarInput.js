import React from 'react'

export default ({store}) => (
	<input onChange={event => store.dispatch({type: 'INCREMENT'})}/>
)