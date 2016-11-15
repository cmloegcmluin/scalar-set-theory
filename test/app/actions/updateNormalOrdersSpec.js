import test from 'ava'
import sinon from 'sinon'

import fetch from '../../../app/lib/normalOrdersList'
import updateNormalOrders from '../../../app/actions/updateNormalOrders'

test.only('calls dispatch with the results from the algorithm', async t => {
	const results = [[0, 1, 2]]
	const dispatchStub = sinon.stub()
	const jsonStub = sinon.stub().returns(results)
	const fetchStub = sinon.stub().returns({json: jsonStub})
	updateNormalOrders.__Rewire__('fetch', fetchStub)

	const expectedAction = {type: 'UPDATE_NORMAL_ORDERS', data: results}

	updateNormalOrders(dispatchStub, [1, 1, 3])
	await fetchStub()
	await jsonStub()

	const action = dispatchStub.getCall(0).args[0]
	t.deepEqual(action, expectedAction)
})