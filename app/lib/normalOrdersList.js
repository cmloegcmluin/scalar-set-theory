import elementCount from '../helpers/elementCount'
import {List} from 'immutable'

import getScalarNames from './scalarNames'

export default scalarSet => {
	const answerLength = elementCount(scalarSet)
	let answer = List(Array.apply(null, Array(answerLength)).map(() => 0))
	const scalarCount = scalarSet.length
	const results = []

	const scalarNames = List(getScalarNames(scalarCount)).reverse().toArray()

	const simpleFixedContent = (t, p, answer) => {
		if (t > answerLength) {
			if (answerLength % p === 0) results.push(answer.shift().map(el => scalarNames[el]).toArray().join('') + ' ')
		} else {
			const atp = answer.get(t - p)
			for (let j = atp; j < scalarCount; j++) {
				if (scalarSet[j]) {
					answer = answer.set(t, j)
					scalarSet[j]--
					simpleFixedContent(t + 1, j === atp ? p : t, answer)
					scalarSet[j]++
				}
			}
		}
	}

	simpleFixedContent(1, 1, answer)

	return results
}