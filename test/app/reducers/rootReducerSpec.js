import test from 'ava'
import {List, Map} from 'immutable'
import equal from 'deep-equal'

import rootReducer from '../../../app/reducers/rootReducer'

test('returns existing state if no action match', t => {
	const state = Map({thing: 'anything'})
	const nextState = rootReducer(state, {type: 'WAKE_UP'})
	t.true(nextState.equals(state))
})

test('updating a scalar also sets calculating to true', t => {
	const state = Map({
		scalarSet: List([1, 2, 1]),
		calculating: false,
		normalOrders: [
			[0, 1, 1, 2],
			[0, 1, 2, 1],
			[0, 2, 1, 1]
		]
	})

	const data = List([1, 1, 1])
	const expectedNextState = Map({
		scalarSet: List([1, 1, 1]),
		calculating: true,
		normalOrders: [
			[0, 1, 1, 2],
			[0, 1, 2, 1],
			[0, 2, 1, 1]
		]
	})

	const nextState = rootReducer(state, {type: 'UPDATE_SCALAR', data})
	t.true(equal(nextState.toObject(), expectedNextState.toObject()))
})

test('updating normal orders also sets calculating to false', t => {
	const state = Map({
		scalarSet: List([1, 1, 1]),
		calculating: true,
		normalOrders: [[0, 1, 1, 2], [0, 1, 2, 1], [0, 2, 1, 1]]
	})

	const data = [[0, 1, 2], [0, 2, 1]]
	const expectedNextState = Map({
		scalarSet: List([1, 1, 1]),
		calculating: false,
		normalOrders: [[0, 1, 2], [0, 2, 1]]
	})

	const nextState = rootReducer(state, {type: 'UPDATE_NORMAL_ORDERS', data})
	t.true(equal(nextState.toObject(), expectedNextState.toObject()))
})

test('reducing scalar count', t => {
	const state = Map({
		scalarCount: 4,
		scalarCountDisplay: 4,
		scalarSet: List([1, 2, 3, 4])
	})

	const data = '2'
	const expectedNextState = Map({
		scalarCount: 2,
		scalarCountDisplay: 2,
		scalarSet: List([1, 2])
	})

	const nextState = rootReducer(state, {type: 'SET_SCALAR_INPUT_COUNT', data})
	t.true(nextState.equals(expectedNextState))
})

test('increasing scalar count', t => {
	const state = Map({
		scalarCount: 4,
		scalarCountDisplay: 4,
		scalarSet: List([1, 2, 3, 4])
	})

	const data = '6'
	const expectedNextState = Map({
		scalarCount: 6,
		scalarCountDisplay: 6,
		scalarSet: List([1, 2, 3, 4, undefined, undefined])
	})

	const nextState = rootReducer(state, {type: 'SET_SCALAR_INPUT_COUNT', data})
	t.true(nextState.equals(expectedNextState))
})

test('deleting scalar count', t => {
	const state = Map({
		scalarCount: 4,
		scalarCountDisplay: 4,
		scalarSet: List([1, 2, 3, 4])
	})

	const data = ''
	const expectedNextState = Map({
		scalarCount: 4,
		scalarCountDisplay: '',
		scalarSet: List([1, 2, 3, 4])
	})

	const nextState = rootReducer(state, {type: 'SET_SCALAR_INPUT_COUNT', data})
	t.true(nextState.equals(expectedNextState))
})

test('negative scalar count', t => {
	const state = Map({
		scalarCount: 0,
		scalarCountDisplay: '',
		scalarSet: List([1])
	})

	const data = '-1'

	const nextState = rootReducer(state, {type: 'SET_SCALAR_INPUT_COUNT', data})
	t.true(nextState.equals(state))
})