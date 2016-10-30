import React from 'react'

export default ({value, index, name, onChange, className, scalarSet}) => (
	<div>
		<span>{name}</span>
		<input {...{
			value,
			className,
			onChange: e => onChange(e.target.value, index, scalarSet)
		}} />
	</div>
)