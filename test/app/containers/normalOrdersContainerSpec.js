import test from 'ava'
import React from 'react'
import {mount} from 'enzyme'
import {Provider} from 'react-redux'
import {Map, List} from 'immutable'
import configureMockStore from 'redux-mock-store'

import arraysEqual from '../../helpers/arraysEqual'
import NormalOrders from '../../../app/components/normalOrders'
import NormalOrdersContainer from '../../../app/containers/normalOrdersContainer'

test('it renders a list of normal orders', t => {
	const initialState = Map({scalarSet: List([1, 2, 3])})
	const store = configureMockStore()(initialState)
	NormalOrders.__Rewire__('normalOrdersList', () => {})
	const wrapper = mount(<Provider
		{...{store, children: <NormalOrdersContainer/>}}
	/>)
	const component = wrapper.find(NormalOrders)
	t.is(component.length, 1)
	t.true(arraysEqual(component.props().scalarSet, [3, 2, 1]))
})