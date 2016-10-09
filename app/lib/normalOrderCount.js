import elementCount from './elementCount'
import sumAcrossReducedSets from './sumAcrossReducedSets'
import permutationCountWre from './permutationCountWre'

//permutation count with redundancies eliminated per element
function permutationCountWrepe(set) {
  return permutationCountWre(set) / elementCount(set)
}

function normalOrderCount(set) {
  return permutationCountWrepe(set) + sumAcrossReducedSets(permutationCountWrepe, set)
}

export default normalOrderCount
