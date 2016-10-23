import elementCount from '../helpers/elementCount'
import {List} from 'immutable'

export default scalarSet => {
	const answerLength = elementCount(scalarSet)
	let answer = List(Array.apply(null, Array(answerLength)).map(() => 0))
	const scalarCount = scalarSet.length

	const simpleFixedContent = (t, p, answer) => {
		if (t > answerLength) { 
			if (answerLength % p === 0) {
				console.log(answer.shift())
			} 
		} else {
			const atp = answer.get(t - p)
			for (let j = atp; j < scalarCount; j++) {
				if (scalarSet[j] !== 0) {
					answer = answer.set(t, j)
					scalarSet[j]--;
					if (j === atp) {
						simpleFixedContent(t + 1, p, answer)
					} else {
						simpleFixedContent(t + 1, t, answer)
					}
					scalarSet[j]++
				}
			}
		}
	}

	simpleFixedContent(1, 1, answer)
}