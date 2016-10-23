import test from 'ava'

import arraysEqual from '../../helpers/arraysEqual'
import normalOrdersList from '../../../app/lib/normalOrdersList'
import normalOrderCount from '../../../app/lib/normalOrderCount'

test('small scalar sets', t => {
	t.true(arraysEqual(normalOrdersList([2,2]), [[0,0,1,1], [0,1,0,1]]))
})

test('medium scalar sets', t => {
	t.true(arraysEqual(normalOrdersList([1,2,2,1]), [[0,1,1,2,2,3],[0,1,1,2,3,2],[0,1,1,3,2,2],[0,1,2,1,2,3],[0,1,2,1,3,2],[0,1,2,2,1,3],[0,1,2,2,3,1],[0,1,2,3,1,2],[0,1,2,3,2,1],[0,1,3,1,2,2],[0,1,3,2,1,2],[0,1,3,2,2,1],[0,2,1,1,2,3],[0,2,1,1,3,2],[0,2,1,2,1,3],[0,2,1,2,3,1],[0,2,1,3,1,2],[0,2,1,3,2,1],[0,2,2,1,1,3],[0,2,2,1,3,1],[0,2,2,3,1,1],[0,2,3,1,1,2],[0,2,3,1,2,1],[0,2,3,2,1,1],[0,3,1,1,2,2],[0,3,1,2,1,2],[0,3,1,2,2,1],[0,3,2,1,1,2],[0,3,2,1,2,1],[0,3,2,2,1,1]]))
})

test('bigger scalar sets', t => {
	t.is(normalOrdersList([6,5,7]).length, normalOrderCount([6,5,7]))
})