import test from 'ava'

import scalarNames from '../../../app/lib/scalarNames'
import arraysEqual from '../../helpers/arraysEqual'

test('with 1 scalar, uses e', t => {
	t.true(arraysEqual(scalarNames(1), ['e']))
})

test('with 2 scalars, uses L s', t => {
	t.true(arraysEqual(scalarNames(2), ['L', 's']))
})

test('with 3 scalars, uses L M s', t => {
	t.true(arraysEqual(scalarNames(3), ['L', 'M', 's']))
})

test('with 4 scalars, uses L M m s', t => {
	t.true(arraysEqual(scalarNames(4), ['L', 'M', 'm', 's']))
})

test.only('with greater than 4 scalars, uses L M m m(1) m(2) m(...) m(n) s', t => {
	t.true(arraysEqual(scalarNames(7), ['L', 'M', 'm', 'm1', 'm2', 'm3', 's']))
})