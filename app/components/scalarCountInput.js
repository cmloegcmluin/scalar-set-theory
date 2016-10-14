import React from 'react'

export default ({scalarCountDisplay, onChange}) => (
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