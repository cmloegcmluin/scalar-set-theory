import {List} from 'immutable'

import range from '../helpers/range'

const scalarNames = [
	[],
	['L'],
	['L', 's'],
	['L', 'M', 's'],
	['L', 'M', 'm', 's']
]

export default scalarCount => {
	if (scalarCount < 5) {
		return scalarNames[scalarCount]
	} else {
		const extraNames = range(scalarCount - 4, 1).map(i => 'm' + i)
		return List(scalarNames[4]).pop().concat(extraNames).push('s').toArray()
	}
}