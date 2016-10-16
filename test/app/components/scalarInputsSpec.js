import test from 'ava'
import React from 'react'
import {shallow} from 'enzyme'

import ScalarInputs from '../../../app/components/scalarInputs'
import ScalarInputContainer from '../../../app/containers/scalarInputContainer'
import range from '../../../app/helpers/range'

const scalarCount = 7
const scalarNames = ['L', 'M', 'm', 'm1', 'm2', 'm3', 's']

let scalarInputContainers

test.beforeEach(() => {
	const wrapper = shallow(<ScalarInputs {...{scalarCount, scalarNames}}/>)
	scalarInputContainers = wrapper.find(ScalarInputContainer)
})

test('renders the right number of scalar input containers', t => {
	t.is(scalarInputContainers.length, 7)
})

test('gives each scalar input the correct index', t => {
	range(scalarCount).forEach(i => {
		t.is(scalarInputContainers.at(i).props().index, i)
	})
})

test('gives each scalar input the correct name', t => {
	range(scalarCount).forEach(i => {
		t.is(scalarInputContainers.at(i).props().name, scalarNames[i])
	})
})