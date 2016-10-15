import {connect} from 'react-redux'

import ScalarInputs from '../components/scalarInputs'

const mapStateToProps = state => ({scalarCount: state.get('scalarCount')})

export default connect(mapStateToProps)(ScalarInputs)