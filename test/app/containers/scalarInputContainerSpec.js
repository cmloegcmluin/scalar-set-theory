import test from 'ava'
import React from 'react'
import {mount} from 'enzyme'
import {Provider} from 'react-redux'
import {List, Map} from 'immutable'
import configureMockStore from 'redux-mock-store'
import sinon from 'sinon'

import ScalarInput from '../../../app/components/scalarInput'
import ScalarInputContainer from '../../../app/containers/scalarInputContainer'

let component, dispatchSpy
const index = 1

test.beforeEach(() => {
	const initialState = Map({scalarSet: List.of(97, 98, 99)})
	const store = configureMockStore()(initialState)
	dispatchSpy = sinon.spy(store, 'dispatch')
	const wrapper = mount(<Provider
		{...{store, children: <ScalarInputContainer {...{index}}/>}}
	/>)
	const container = wrapper.find(ScalarInputContainer)
	component = container.find(ScalarInput)
})

test('renders one scalar input', t => {
	t.is(component.length, 1)
})

test('gives it the correct index from the scalar set as its value', t => {
	t.is(component.props().value, 98)
})

test('connects it to dispatch, using its index', t => {
	component.find('input').simulate('change', {target: {value: 96}})
	t.true(dispatchSpy.calledWith({
		type: 'UPDATE_SCALAR',
		data: {...{index, val: 96}}
	}))
})