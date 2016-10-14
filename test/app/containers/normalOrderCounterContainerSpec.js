import test from 'ava'
import React from 'react'
import {mount, shallow} from 'enzyme'
import {Provider} from 'react-redux'
import {Map, List} from 'immutable'
import configureMockStore from 'redux-mock-store'

import NormalOrderCounter from '../../../app/components/normalOrderCounter'
import NormalOrderCounterContainer from '../../../app/containers/normalOrderCounterContainer'

import jsdom from 'jsdom';
const doc = jsdom.jsdom('<!doctype html><html><body></body></html>');
const win = doc.defaultView;
global.document = doc;
global.window = win;

const mockStore = configureMockStore()

test('renders a normal order container', t => {
	const initialState = Map({scalarSet: List.of(0,1,0)})
	const store = mockStore(initialState)

	const wrapper = mount(<Provider {...{store, children: <NormalOrderCounterContainer/>}}/>)
	const container = wrapper.find(NormalOrderCounterContainer)
	const component = container.find(NormalOrderCounter)
	t.is(component.length, 1)

	const expected = [0,1,0]
	t.true(component.props().scalarSet.every((el, i) => el === expected[i]))
})