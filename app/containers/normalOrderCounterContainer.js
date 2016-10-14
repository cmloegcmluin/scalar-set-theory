import {connect} from 'react-redux'

import NormalOrderCounter from '../components/normalOrderCounter'

const mapStateToProps = state => ({
	scalarSet: state.get('scalarSet').toArray().filter(el => el !== undefined)
})

export default connect(mapStateToProps)(NormalOrderCounter)