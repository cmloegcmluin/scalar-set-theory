import {Map, List} from 'immutable'

export default Map({
	scalarCount: 3,
	scalarSet: List([1, 2, 1]),
	scalarCountDisplay: 3,
	calculating: false,
	normalOrders: [[0, 1, 1, 2], [1, 0, 1, 2], [1, 1, 0, 2]]
})