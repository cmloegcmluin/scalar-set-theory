import test from 'ava'
import React from 'react'
import {mount} from 'enzyme'
import {Provider} from 'react-redux'
import {Map, List} from 'immutable'
import configureMockStore from 'redux-mock-store'

import NormalOrderCounter from '../../../app/components/normalOrderCounter'
import NormalOrderCounterContainer from '../../../app/containers/normalOrderCounterContainer'

let component
const scalarSet = [1, undefined, 2, 0, undefined]
const filteredScalarSet = [1, 2, 0]

test.beforeEach(t => {
	const initialState = Map({scalarSet: List(scalarSet)})
	const store = configureMockStore()(initialState)
	const wrapper = mount(<Provider 
		{...{store, children: <NormalOrderCounterContainer/>}}
	/>)
	const container = wrapper.find(NormalOrderCounterContainer)
	component = container.find(NormalOrderCounter)
})

test('renders one normal order counter', t => {
	t.is(component.length, 1)
})

test('passes it the scalarSet with undefined elements filtered', t => {
	t.true(component.props().scalarSet.every(
		(el, i) => el === filteredScalarSet[i])
	)
})