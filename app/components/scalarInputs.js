import React from 'react'
import {connect} from 'react-redux'

import ScalarInput from './scalarInput'

import range from '../helpers/range'

const mapStateToProps = state => ({scalarCount: state.scalarCount})

export default connect(mapStateToProps)(
	({scalarCount}) => (
		<div>
			{range(scalarCount).map(
				index => <ScalarInput index={index} key={index}/>
			)}
		</div>
	)
)