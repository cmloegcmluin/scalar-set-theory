import test from 'ava'

import arraysEqual from '../../helpers/arraysEqual'
import normalOrdersList from '../../../app/lib/normalOrdersList'
import normalOrderCount from '../../../app/lib/normalOrderCount'

test('small scalar sets', t => {
	t.true(arraysEqual(
		normalOrdersList.getList([2,2]), [[0,0,1,1], [0,1,0,1]]
	))
})

test('bigger scalar sets', t => {
	t.is(normalOrdersList.getList([6,5,7]).length, normalOrderCount([6,5,7]))
})

test('it does it how Stephen wants it', t => {
	t.true(arraysEqual(
		normalOrdersList.getList([1,1,1]), [[0,1,2], [1,0,2]]
	))
})