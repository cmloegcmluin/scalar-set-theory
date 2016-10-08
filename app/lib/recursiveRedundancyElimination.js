import sumAcrossReducedSets from './setReductions';
import permutationsWithRepetitionOfIndistinguishableElementsCount from './permutations';

function redundanciesToEliminate(set) {
  return sumAcrossReducedSets(permutationCountWithRedundanciesEliminated, set);
}

function permutationCountWithRedundanciesEliminated(set) {
  return permutationsWithRepetitionOfIndistinguishableElementsCount(set) - redundanciesToEliminate(set);
}

export default permutationCountWithRedundanciesEliminated;
