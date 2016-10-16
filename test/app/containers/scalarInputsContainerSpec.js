import test from 'ava'
import React from 'react'
import {mount} from 'enzyme'
import {Provider} from 'react-redux'
import {Map} from 'immutable'
import configureMockStore from 'redux-mock-store'
import sinon from 'sinon'

import ScalarInputs from '../../../app/components/scalarInputs'
import ScalarInputsContainer from '../../../app/containers/scalarInputsContainer'

const scalarCount = 6
const scalarNamesSpy = sinon.stub()
const expectedNames = ['a', 'b', 'c', 'd', 'e', 'f']
let component

test.beforeEach(() => {
	scalarNamesSpy.returns(expectedNames)
	ScalarInputsContainer.__Rewire__('getScalarNames', scalarNamesSpy)

	ScalarInputs.__Rewire__('ScalarInputContainer', () => <div/>)

	const initialState = Map({...{scalarCount}})
	const store = configureMockStore()(initialState)
	const wrapper = mount(<Provider
		{...{store, children: <ScalarInputsContainer/>}}
	/>)
	const container = wrapper.find(ScalarInputsContainer)
	component = container.find(ScalarInputs)
})

test('renders one scalar inputs component with the correct count', t => {
	t.is(component.length, 1)
	t.is(component.props().scalarCount, scalarCount)
})

test('gets the scalar names and passes them on', t => {
	t.true(scalarNamesSpy.calledWith(6))
	t.is(component.props().scalarNames, expectedNames)
})