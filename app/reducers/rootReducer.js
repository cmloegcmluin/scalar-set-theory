import initialState from '../initialState'

export default (state = initialState, action) => {
	switch (action.type) {
	case 'SET_SCALAR_INPUT_COUNT': {
		const count = parseInt(action.data)
		if (count && count > 0) {
			return state
				.set('scalarCount', count)
				.set('scalarCountDisplay', count)
				.set('scalarSet', state.get('scalarSet').setSize(count))
		}
		return state
			.set('scalarCountDisplay', '')
	}
	case 'UPDATE_SCALAR': {
		return state
			.set('scalarSet', action.data)
			.set('calculating', true)
	}
	case 'UPDATE_NORMAL_ORDERS': {
		return state
			.set('normalOrders', action.data)
			.set('calculating', false)
	}
	default:
		return state
	}
}