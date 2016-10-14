import test from 'ava'
import React from 'react'
import {mount} from 'enzyme'
import {Provider} from 'react-redux'
import {Map, List} from 'immutable'
import configureMockStore from 'redux-mock-store'

import NormalOrderCounter from '../../../app/components/normalOrderCounter'
import NormalOrderCounterContainer from '../../../app/containers/normalOrderCounterContainer'

test('renders a normal order container', t => {
	const initialState = Map({scalarSet: List.of(0,1,0)})
	const store = configureMockStore()(initialState)

	const wrapper = mount(<Provider {...{store, children: <NormalOrderCounterContainer/>}}/>)
	const container = wrapper.find(NormalOrderCounterContainer)
	const component = container.find(NormalOrderCounter)
	t.is(component.length, 1)

	const expected = [0,1,0]
	t.true(component.props().scalarSet.every((el, i) => el === expected[i]))
})