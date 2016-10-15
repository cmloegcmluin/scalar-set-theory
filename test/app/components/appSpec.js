import test from 'ava'
import React from 'react'
import {shallow} from 'enzyme'

import App from '../../../app/components/app'
import ScalarCountInputContainer from '../../../app/containers/scalarCountInputContainer'
import ScalarInputsContainer from '../../../app/containers/scalarInputsContainer'
import NormalOrderCounterContainer from '../../../app/containers/normalOrderCounterContainer'

test('renders the parts of the app', t => {
	const wrapper = shallow(<App/>)
	const normalOrderCounterContainer = wrapper.find(NormalOrderCounterContainer)
	t.is(normalOrderCounterContainer.length, 1)
	const scalarInputsContainer = wrapper.find(ScalarInputsContainer)
	t.is(scalarInputsContainer.length, 1)
	const scalarCountInputContainer = wrapper.find(ScalarCountInputContainer)
	t.is(scalarCountInputContainer.length, 1)
})