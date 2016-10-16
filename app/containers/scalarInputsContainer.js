import {connect} from 'react-redux'

import ScalarInputs from '../components/scalarInputs'
import getScalarNames from '../lib/scalarNames'

const mapStateToProps = state => {
	const scalarCount = state.get('scalarCount')
	const scalarNames = getScalarNames(scalarCount)
	return {...{scalarCount, scalarNames}}
}

export default connect(mapStateToProps)(ScalarInputs)