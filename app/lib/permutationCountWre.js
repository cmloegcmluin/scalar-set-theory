import sumAcrossReducedSets from './sumAcrossReducedSets';
import permutationsWroieCount from './permutationsWroieCount';

function redundanciesToEliminate(set) {
  return sumAcrossReducedSets(permutationCountWre, set);
}

//permutation count with redundancies eliminated
function permutationCountWre(set) {
  return permutationsWroieCount(set) - redundanciesToEliminate(set);
}

export default permutationCountWre;
