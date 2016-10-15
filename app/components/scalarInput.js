import React from 'react'

export default ({value, index, name, onChange, className}) => (
	<div>
		<span>{name}</span>
		<input
			{...{value, className, onChange: e => onChange(e.target.value, index)}}
		/>
	</div>
)