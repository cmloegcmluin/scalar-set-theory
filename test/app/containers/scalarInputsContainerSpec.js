import test from 'ava'
import React from 'react'
import {mount} from 'enzyme'
import {Provider} from 'react-redux'
import {Map} from 'immutable'
import configureMockStore from 'redux-mock-store'

import ScalarInputs from '../../../app/components/scalarInputs'
import ScalarInputsContainer from '../../../app/containers/scalarInputsContainer'

test('renders a scalar inputs component', t => {
	const initialState = Map({scalarCount: 6})
	const store = configureMockStore()(initialState)
	ScalarInputs.__Rewire__('ScalarInputContainer', () => <div/>)
	const wrapper = mount(<Provider
		{...{store, children: <ScalarInputsContainer/>}}
	/>)
	const container = wrapper.find(ScalarInputsContainer)
	const component = container.find(ScalarInputs)
	t.is(component.length, 1)
	t.is(component.props().scalarCount, 6)
})