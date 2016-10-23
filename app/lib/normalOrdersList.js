import elementCount from '../helpers/elementCount'
import {List} from 'immutable'

export default scalarSet => {
	const answerLength = elementCount(scalarSet)
	let answer = Array.apply(null, Array(answerLength)).map(() => 0)
	const scalarCount = scalarSet.length
	const results = []

	const simpleFixedContent = (t = 1, p = 1) => {
		if (t > answerLength) {
			if (answerLength % p === 0) results.push(answer.slice(1))
		} else {
			const atp = answer[t - p]
			for (let j = atp; j < scalarCount; j++) {
				if (scalarSet[j]) {
					answer[t] = j
					scalarSet[j]--
					simpleFixedContent(t + 1, j === atp ? p : t)
					scalarSet[j]++
				}
			}
		}
	}

	simpleFixedContent()

	return results
}