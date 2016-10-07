var React = require('react');

class NormalOrderCounter extends React.Component {
  render() {
    return <div>And the count is: {normalOrderCount(this.props.scalarSet)}</div>
  }
}

module.exports = NormalOrderCounter;

function factorial(n) {
  if (n <= 1) return 1;
  return n * factorial(n - 1);
}

function elementCount(set) {
  return set.reduce((memo, num) => memo + num, 0);
}

function permutationsCount(set) {
  return factorial(elementCount(set));
}

function indistinguishableElementRepetitionFactor(set) {
  return set.reduce((memo, num) => memo * factorial(num), 1);
}

function permutationsWithRepetitionOfIndistinguishableElementsCount(set) {
  return permutationsCount(set) / indistinguishableElementRepetitionFactor(set);
}

function equalDivisorsOfSet(set) {
  var range = Array.from(Array(Math.max.apply(Math, set) - 1), (_, i) => 2 + i);
  return range.filter(num => set.every(el => el % num === 0));
}

function setReductions(set) {
  return equalDivisorsOfSet(set).map(divisor => set.map(el => el / divisor));
}

function sumAcrossReducedSets(fn, set) {
  return setReductions(set).reduce((memo, reducedSet) => memo += fn(reducedSet), 0);
}

function redundanciesToEliminate(set) {
  return sumAcrossReducedSets(permutationCountWithRedundanciesEliminated, set);
}

function permutationCountWithRedundanciesEliminated(set) {
  return permutationsWithRepetitionOfIndistinguishableElementsCount(set) - redundanciesToEliminate(set);
}

function permutationCountWithRedundanciesEliminatedPerElement(set) {
  return permutationCountWithRedundanciesEliminated(set) / elementCount(set);
}

function normalOrderCount(set) {
  return permutationCountWithRedundanciesEliminatedPerElement(set) + sumAcrossReducedSets(permutationCountWithRedundanciesEliminatedPerElement, set);
}
