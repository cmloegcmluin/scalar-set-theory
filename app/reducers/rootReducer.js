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
		const val = parseInt(action.data.val) || 0
		const {index} = action.data
		return state
			.set('scalarSet', state.get('scalarSet').set(index, val))
	}
	default:
		return state
	}
}