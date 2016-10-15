import test from 'ava'

import scalarName from '../../../app/lib/scalarName'

test('with 1 scalar, uses e', t => {
	t.is(scalarName(0, 1), 'e')
})

test('with 2 scalars, uses L s', t => {
	t.is(scalarName(0, 2), 'L')
	t.is(scalarName(1, 2), 's')
})

test('with 3 scalars, uses L M s', t => {
	t.is(scalarName(0, 3), 'L')
	t.is(scalarName(1, 3), 'M')
	t.is(scalarName(2, 3), 's')
})

test('with 4 scalars, uses L M m s', t => {
	t.is(scalarName(0, 4), 'L')
	t.is(scalarName(1, 4), 'M')
	t.is(scalarName(2, 4), 'm')
	t.is(scalarName(3, 4), 's')
})

test.only('with greater than 4 scalars, uses L M m m(1) m(2) m(...) m(n) s', t => {
	t.is(scalarName(0, 7), 'L')
	t.is(scalarName(1, 7), 'M')
	t.is(scalarName(2, 7), 'm')
	t.is(scalarName(3, 7), 'm1')
	t.is(scalarName(4, 7), 'm2')
	t.is(scalarName(5, 7), 'm3')
	t.is(scalarName(6, 7), 's')
})