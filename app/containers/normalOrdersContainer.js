import {connect} from 'react-redux'

import NormalOrders from '../components/normalOrders'

const mapStateToProps = state => ({
	scalarSet: state.get('scalarSet').reverse().toArray()
})

export default connect(mapStateToProps)(NormalOrders)