import test from 'ava'
import React from 'react'
import {shallow} from 'enzyme'

import NormalOrderCounter from '../../../app/components/normalOrderCounter'

test('calculates a simple normal order count', t => {
	const wrapper = shallow(<NormalOrderCounter {...{scalarSet: [1, 2, 1]}}/>)
	t.is(wrapper.text(), 'Normal order count:3')
})

test('shows 0 when all scalars are zero', t => {
	const wrapper = shallow(<NormalOrderCounter {...{scalarSet: [0, 0]}}/>)
	t.is(wrapper.text(), 'Normal order count:0')
})

test('calculates a big normal order count', t => {
	const wrapper = shallow(<NormalOrderCounter {...{scalarSet: [20, 20]}}/>)
	t.is(wrapper.text(), 'Normal order count:3446167860')
})

test('gives a nice message if the normal order count is too big', t => {
	const wrapper = shallow(<NormalOrderCounter {...{scalarSet: [99, 99]}}/>)
	t.is(wrapper.text(), "Normal order count:Sorry, this one's beyond me.")
})