import elementCount from './elementCount'

function factorial(n) {
  if (n <= 1) return 1
  return n * factorial(n - 1)
}

function permutationsCount(set) {
  return factorial(elementCount(set))
}

function indistinguishableElementRepetitionFactor(set) {
  return set.reduce((memo, num) => memo * factorial(num), 1)
}

//permutations with repetition of indistinguishable elements count
function permutationsWroieCount(set) {
  return permutationsCount(set) / indistinguishableElementRepetitionFactor(set)
}

export default permutationsWroieCount
