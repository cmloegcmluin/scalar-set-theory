import range from '../helpers/range'

const scalarNames = [
	[],
	['e'],
	['L', 's'],
	['L', 'M', 's'],
	['L', 'M', 'm', 's']
]

export default (index, scalarCount) => {
	if (scalarCount < 5) {
		return scalarNames[scalarCount][index]
	} else {
		const extraNames = range(scalarCount - 4).map(i => 'm' + (i + 1))
		let base = scalarNames[4].slice()
		base.pop()
		base = base.concat(extraNames)
		base.push('s')
		return base[index]
	}
}