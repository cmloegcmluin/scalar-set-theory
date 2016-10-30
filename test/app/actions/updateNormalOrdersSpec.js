import test from 'ava'
import sinon from 'sinon'

import normalOrdersList from '../../../app/lib/normalOrdersList'
import updateNormalOrders from '../../../app/actions/updateNormalOrders'

test.only('calls dispatch with the results from the algorithm', async t => {
	const results = [[0, 1, 2]]
	const normalOrdersPromiseStub = sinon.stub()
	const dispatchSpy = sinon.spy()
	sinon.stub(normalOrdersList, 'getList', () => results)
	updateNormalOrders.__Rewire__('normalOrdersPromise', normalOrdersPromiseStub)
	updateNormalOrders(dispatchSpy, [1, 1, 3])
	t.false(dispatchSpy.called)
	await normalOrdersPromiseStub() //does not appear to be necessary...
	setTimeout(() => { //I wish I could figure out how to not have to do this
		t.true(dispatchSpy.called)
		t.true(dispatchSpy.calledWith({type: 'UPDATE_NORMAL_ORDERS', results}))
	}, 0)
})