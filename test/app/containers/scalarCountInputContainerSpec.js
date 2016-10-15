import test from 'ava'
import React from 'react'
import {mount} from 'enzyme'
import {Provider} from 'react-redux'
import {Map} from 'immutable'
import configureMockStore from 'redux-mock-store'
import sinon from 'sinon'

import ScalarCountInput from '../../../app/components/scalarCountInput'
import ScalarCountInputContainer from '../../../app/containers/scalarCountInputContainer'

let component, dispatchSpy

test.beforeEach(t => {
	const initialState = Map({scalarCountDisplay: 4})
	const store = configureMockStore()(initialState)
	dispatchSpy = sinon.spy(store, 'dispatch')
	const wrapper = mount(<Provider
		{...{store, children: <ScalarCountInputContainer/>}}
	/>)
	const container = wrapper.find(ScalarCountInputContainer)
	component = container.find(ScalarCountInput)
})

test('renders one scalar count input', t => {
	t.is(component.length, 1)
})

test('it pulls the display value from the central store for it', t => {
	t.is(component.props().scalarCountDisplay, 4)
})

test('connects it to dispatch', t => {
	const value = 5
	component.find('input').simulate('change', {target: {...{value}}})
	t.true(dispatchSpy.calledWith({
		type: 'SET_SCALAR_INPUT_COUNT',
		data: value
	}))
})