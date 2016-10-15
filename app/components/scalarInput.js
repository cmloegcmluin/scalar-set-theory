import React from 'react'

export default ({value, index, onChange, className}) => (
	<input
		{...{value, className, onChange: e => onChange(e.target.value, index)}}
	/>
)