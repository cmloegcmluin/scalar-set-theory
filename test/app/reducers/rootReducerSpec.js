import test from 'ava'
import rootReducer from '../../../app/reducers/rootReducer'
import {List, Map} from 'immutable'

test('returns existing state if no action match', t => {
	const state = Map({thing: 'anything'})
	const nextState = rootReducer(state, {type: 'WAKE_UP'})
	t.true(nextState.equals(state))
})

test('updating a scalar', t => {
	const state = Map({scalarSet: List.of(1, 2, 1)})

	const data = {index: 2, val: '9'}
	const expectedNextState = Map({scalarSet: List.of(1, 2, 9)})

	const nextState = rootReducer(state, {type: 'UPDATE_SCALAR', data})
	t.true(nextState.equals(expectedNextState))
})

test('deleting a scalar', t => {
	const state = Map({scalarSet: List.of(1, 2, 1)})

	const data = {index: 2, val: undefined}
	const expectedNextState = Map({scalarSet: List.of(1, 2, 0)})

	const nextState = rootReducer(state, {type: 'UPDATE_SCALAR', data})
	t.true(nextState.equals(expectedNextState))
})

test('setting scalar to something invalid like a letter', t => {
	const state = Map({scalarSet: List.of(1, 2, 1)})

	const data = {index: 2, val: 'r'}
	const expectedNextState = Map({scalarSet: List.of(1, 2, 0)})

	const nextState = rootReducer(state, {type: 'UPDATE_SCALAR', data})
	t.true(nextState.equals(expectedNextState))
})

test('reducing scalar count', t => {
	const state = Map({
		scalarCount: 4,
		scalarCountDisplay: 4,
		scalarSet: List.of(1, 2, 3, 4)
	})

	const data = '2'
	const expectedNextState = Map({
		scalarCount: 2,
		scalarCountDisplay: 2,
		scalarSet: List.of(1, 2)
	})

	const nextState = rootReducer(state, {type: 'SET_SCALAR_INPUT_COUNT', data})
	t.true(nextState.equals(expectedNextState))
})

test('increasing scalar count', t => {
	const state = Map({
		scalarCount: 4,
		scalarCountDisplay: 4,
		scalarSet: List.of(1, 2, 3, 4)
	})

	const data = '6'
	const expectedNextState = Map({
		scalarCount: 6,
		scalarCountDisplay: 6,
		scalarSet: List.of(1, 2, 3, 4, undefined, undefined)
	})

	const nextState = rootReducer(state, {type: 'SET_SCALAR_INPUT_COUNT', data})
	t.true(nextState.equals(expectedNextState))
})

test('deleting scalar count', t => {
	const state = Map({
		scalarCount: 4,
		scalarCountDisplay: 4,
		scalarSet: List.of(1, 2, 3, 4)
	})

	const data = ''
	const expectedNextState = Map({
		scalarCount: 4,
		scalarCountDisplay: '',
		scalarSet: List.of(1, 2, 3, 4)
	})

	const nextState = rootReducer(state, {type: 'SET_SCALAR_INPUT_COUNT', data})
	t.true(nextState.equals(expectedNextState))
})

test('negative scalar count', t => {
	const state = Map({
		scalarCount: 0,
		scalarCountDisplay: '',
		scalarSet: List.of(1)
	})

	const data = '-1'

	const nextState = rootReducer(state, {type: 'SET_SCALAR_INPUT_COUNT', data})
	t.true(nextState.equals(state))
})