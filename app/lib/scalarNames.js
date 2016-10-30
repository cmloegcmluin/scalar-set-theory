import range from '../helpers/range'

const scalarNames = [
	[],
	['L'],
	['s', 'L'],
	['s', 'M', 'L'],
	['s', 'm', 'M', 'L']
]

export default scalarCount => {
	if (scalarCount < 5) {
		return scalarNames[scalarCount]
	} else {
		const extraNames = range(scalarCount - 4, 1).map(i => String(i)).reverse()
		return ['s'].concat(extraNames).concat(['m', 'M', 'L'])
	}
}