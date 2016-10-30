import test from 'ava'
import React from 'react'
import {mount} from 'enzyme'
import {Provider} from 'react-redux'
import {Map, List} from 'immutable'
import configureMockStore from 'redux-mock-store'

import NormalOrders from '../../../app/components/normalOrders'
import NormalOrdersContainer from '../../../app/containers/normalOrdersContainer'

test('it renders a list of normal orders', t => {
	const initialState = Map({
		scalarSet: List([2, 2]),
		calculating: false,
		normalOrders: [[0, 0, 1, 1], [0, 1, 0, 1]]
	})
	const store = configureMockStore()(initialState)
	const wrapper = mount(<Provider
		{...{store, children: <NormalOrdersContainer/>}}
	/>)
	const component = wrapper.find(NormalOrders)
	t.is(component.length, 1)
	t.is(component.props().normalOrders, 'ssLL sLsL ')
})

test('says Loading if still calculating', t => {
	const initialState = Map({
		scalarSet: List([2, 2]),
		calculating: true,
		normalOrders: [[0, 1, 1]]
	})
	const store = configureMockStore()(initialState)
	const wrapper = mount(<Provider
		{...{store, children: <NormalOrdersContainer/>}}
	/>)
	const component = wrapper.find(NormalOrders)
	t.is(component.length, 1)
	t.is(component.props().normalOrders, 'Loading...')
})