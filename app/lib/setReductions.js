function equalDivisorsOfSet(set) {
  const range = Array.from(Array(Math.max.apply(Math, set) - 1), (_, i) => 2 + i);
  return range.filter(num => set.every(el => el % num === 0));
}

function setReductions(set) {
  return equalDivisorsOfSet(set).map(divisor => set.map(el => el / divisor));
}

function sumAcrossReducedSets(fn, set) {
  return setReductions(set).reduce((memo, reducedSet) => memo += fn(reducedSet), 0);
}

export default sumAcrossReducedSets;
