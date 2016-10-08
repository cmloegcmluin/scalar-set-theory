import elementCount from './elementCount';
import sumAcrossReducedSets from './setReductions';
import permutationCountWithRedundanciesEliminated from './recursiveRedundancyElimination';

function permutationCountWithRedundanciesEliminatedPerElement(set) {
  return permutationCountWithRedundanciesEliminated(set) / elementCount(set);
}

function normalOrderCount(set) {
  return permutationCountWithRedundanciesEliminatedPerElement(set) + sumAcrossReducedSets(permutationCountWithRedundanciesEliminatedPerElement, set);
}

export default normalOrderCount;
