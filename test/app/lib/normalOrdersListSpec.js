import test from 'ava'

import arraysEqual from '../../helpers/arraysEqual'
import normalOrdersList from '../../../app/lib/normalOrdersList'
import normalOrderCount from '../../../app/lib/normalOrderCount'

test('small scalar sets', t => {
	t.true(arraysEqual(normalOrdersList([2,2]), ['ssLL ', 'sLsL ']))
})

test('medium scalar sets', t => {
	t.true(arraysEqual(normalOrdersList([1,2,2,1]), ['smmMML ', 'smmMLM ', 'smmLMM ', 'smMmML ', 'smMmLM ', 'smMMmL ', 'smMMLm ', 'smMLmM ', 'smMLMm ', 'smLmMM ', 'smLMmM ', 'smLMMm ', 'sMmmML ', 'sMmmLM ', 'sMmMmL ', 'sMmMLm ', 'sMmLmM ', 'sMmLMm ', 'sMMmmL ', 'sMMmLm ', 'sMMLmm ', 'sMLmmM ', 'sMLmMm ', 'sMLMmm ', 'sLmmMM ', 'sLmMmM ', 'sLmMMm ', 'sLMmmM ', 'sLMmMm ', 'sLMMmm ']))
})

test('bigger scalar sets', t => {
	t.is(normalOrdersList([6,5,7]).length, normalOrderCount([6,5,7]))
})