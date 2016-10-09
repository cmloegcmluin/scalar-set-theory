import range from './range'

function maxOfSet(set) {
	return Math.max.apply(Math, set)
}

function equalDivisorsOfSet(set) {
  return range(maxOfSet(set) - 1, 2).filter(num => set.every(el => el % num === 0))
}

function setReductions(set) {
  return equalDivisorsOfSet(set).map(divisor => set.map(el => el / divisor))
}

function sumAcrossReducedSets(fn, set) {
  return setReductions(set).reduce((memo, reducedSet) => memo += fn(reducedSet), 0)
}

export default sumAcrossReducedSets