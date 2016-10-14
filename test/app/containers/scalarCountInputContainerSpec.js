import test from 'ava'
import React from 'react'
import {mount} from 'enzyme'
import {Provider} from 'react-redux'
import {Map} from 'immutable'
import configureMockStore from 'redux-mock-store'
import sinon from 'sinon'

import ScalarCountInput from '../../../app/components/scalarCountInput'
import ScalarCountInputContainer from '../../../app/containers/scalarCountInputContainer'

test('renders a scalar count input', t => {
	const initialState = Map({scalarCountDisplay: 4})
	const store = configureMockStore()(initialState)
	const dispatchSpy = sinon.spy(store, 'dispatch')

	const wrapper = mount(<Provider
		{...{store, children: <ScalarCountInputContainer/>}}
	/>)
	const container = wrapper.find(ScalarCountInputContainer)
	const component = container.find(ScalarCountInput)
	t.is(component.length, 1)

	t.is(component.props().scalarCountDisplay, 4)
	component.find('input').simulate('change', {target: {value: 5}})
	t.true(dispatchSpy.called)
	t.true(dispatchSpy.calledWith({type: 'SET_SCALAR_INPUT_COUNT', data: 5}))
})