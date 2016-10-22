import elementCount from '../helpers/elementCount'
import {List} from 'immutable'

const scalarSet = [2, 1, 2]
// scalarSet[0]--;

const answerLengthAssumingFirstIsZero = elementCount(scalarSet)
let answer = List(Array.apply(null, Array(answerLengthAssumingFirstIsZero /*+ 1*/)).map(() => 0))
const scalarCount = scalarSet.length

const simpleFixedContent = (t, p, answer) => {
	if (t > answerLengthAssumingFirstIsZero) { 
		if (answerLengthAssumingFirstIsZero % p === 0) {
			console.log('*******************************', answer.shift())
		} 
		// else {
		// 	console.log('skipped this one ', answer)
		// }
	} else {
		// const atp = answer.get((t - p) - 1)
		const atp = answer.get((t - p) /*- 1*/ )
		// console.log('\nsettin atp', atp, answer, t, p, ((t-p)-1))
		for (let j = atp; j < scalarCount; j++) {
			if (scalarSet[j] !== 0) {
				answer = answer.set(t, j)
				scalarSet[j]--;
				// console.log('')
				// console.log(scalarSet)
				// console.log(answer)
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

export default () => simpleFixedContent(1, 1, answer) //or maybe (1, 0, answer)