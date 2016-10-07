var React = require('react');
var _ = require('underscore');

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
  return _.reduce(set, function(memo, num) { return memo + num; }, 0);
}

function permutationsCount(set) {
  return factorial(elementCount(set));
}

function indistinguishableElementRepetitionFactor(set) {
  return _.reduce(set, function(memo, num) { return memo * factorial(num); }, 1);
}

function permutationsWithRepetitionOfIndistinguishableElementsCount(set) {
  return permutationsCount(set) / indistinguishableElementRepetitionFactor(set);
}

function equalDivisorsOfSet(set) {
  var range = _.range(2, Math.max.apply(Math, set) + 1);
  return _.filter(range, function(num) {
    return _.every(set, function(el) { return el % num === 0; });
  });
}

function setReductions(set) {
  return _.map(equalDivisorsOfSet(set), function(divisor) {
    return _.map(set, function(el) { return el / divisor; });
  });
}

function sumAcrossReducedSets(fn, set) {
  return _.reduce(setReductions(set), function(memo, reducedSet) {
    return memo += fn(reducedSet);
  }, 0);
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
