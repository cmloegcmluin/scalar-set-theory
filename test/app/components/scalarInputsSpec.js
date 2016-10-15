import test from 'ava'
import React from 'react'
import {shallow} from 'enzyme'

import ScalarInputs from '../../../app/components/scalarInputs'
import ScalarInputContainer from '../../../app/containers/scalarInputContainer'

test('renders the right number of scalar input containers', t => {
	const wrapper = shallow(<ScalarInputs {...{scalarCount: 7}}/>)
	const scalarInputContainers = wrapper.find(ScalarInputContainer)
	t.is(scalarInputContainers.length, 7)
})