import test from 'ava'
import React from 'react'
import {shallow} from 'enzyme'
import sinon from 'sinon'

import ScalarInput from '../../../app/components/scalarInput'

let wrapper
const value = 5
const index = 3
const name = 'm9'
const onChange = sinon.spy()

test.beforeEach(() => {
	wrapper = shallow(<ScalarInput {...{value, index, name, onChange}}/>)
})

test('sets the value of the input ', t => {
	t.is(wrapper.find('input').props().value, value)
})

test('calls its callback with the new value and the index', t => {
	const newValue = 6
	wrapper.find('input').simulate('change', {target: {value: newValue}})
	t.true(onChange.calledWith(newValue, index))
})

test('renders the name', t => {
	t.is(wrapper.find('span').text(), name)
})