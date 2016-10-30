import test from 'ava'
import React from 'react'
import {shallow} from 'enzyme'

import NormalOrders from '../../../app/components/normalOrders'

test('renders the normal orders', t => {
	const wrapper = shallow(<NormalOrders {...{normalOrders: 'ssLL sLsL '}} />)
	t.true(wrapper.text() == 'ssLL sLsL ')
})