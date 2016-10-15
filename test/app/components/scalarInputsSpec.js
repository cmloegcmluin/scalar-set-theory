import test from 'ava'
import React from 'react'
import {shallow} from 'enzyme'
import sinon from 'sinon'

import ScalarInputs from '../../../app/components/scalarInputs'
import ScalarInputContainer from '../../../app/containers/scalarInputContainer'
import range from '../../../app/helpers/range'

const scalarCount = 7

test('renders the right number of scalar input containers', t => {
	const wrapper = shallow(<ScalarInputs {...{scalarCount}}/>)
	const scalarInputContainers = wrapper.find(ScalarInputContainer)
	t.is(scalarInputContainers.length, 7)
})

test('gives each scalar input the correct index', t => {
	const wrapper = shallow(<ScalarInputs {...{scalarCount}}/>)
	const scalarInputContainers = wrapper.find(ScalarInputContainer)
	range(scalarCount).forEach(i => {
		t.is(scalarInputContainers.at(i).props().index, i)
	})
})

test('gives each scalar input the correct label', t => {
	const scalarNameSpy = sinon.spy()
	ScalarInputs.__Rewire__('scalarName', scalarNameSpy)
	shallow(<ScalarInputs {...{scalarCount}}/>)
	range(scalarCount).forEach(i => {
		const call = scalarNameSpy.getCall(i)
		t.is(call.args[0], i)
		t.is(call.args[1], scalarCount)
	})
})