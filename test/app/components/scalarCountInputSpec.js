import test from 'ava'
import React from 'react'
import {shallow} from 'enzyme'
import sinon from 'sinon'

import ScalarCountInput from '../../../app/components/scalarCountInput'

test(t => {
	const onChangeSpy = sinon.spy()
	const wrapper = shallow(
		<ScalarCountInput {...{scalarCountDisplay: 5, onChange: onChangeSpy}}/>
	)
	t.is(wrapper.find('input').props().value, 5)
	wrapper.find('input').simulate('change')
	t.true(onChangeSpy.called)
})