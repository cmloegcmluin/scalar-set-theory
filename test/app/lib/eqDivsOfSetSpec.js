import test from 'ava'

import arraysEqual from '../../helpers/arraysEqual'
import eqDivsOfSet from '../../../app/lib/eqDivsOfSet'

test('composite set', t => {
	t.true(arraysEqual(eqDivsOfSet([20, 20]), [2, 4, 5, 10, 20]))
})

test('no equal divisors', t => {
	t.true(arraysEqual(eqDivsOfSet([2, 3], [])))
})