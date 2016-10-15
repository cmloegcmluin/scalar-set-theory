import {connect} from 'react-redux'

import ScalarCountInput from '../components/scalarCountInput'

const mapStateToProps = state => ({
	scalarCountDisplay: state.get('scalarCountDisplay')
})

const mapDispatchToProps = dispatch => ({
	onChange: e => dispatch({
		type: 'SET_SCALAR_INPUT_COUNT', data: e.target.value
	})
})

export default connect(mapStateToProps, mapDispatchToProps)(ScalarCountInput)