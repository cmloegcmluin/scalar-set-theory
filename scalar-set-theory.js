var scalarSet = [20, 20];

function factorial(n) {
  if (n <= 1) return 1;
  return n * factorial(n - 1);
}

function elementCount(set) {
  var total = 0;
  set.forEach(function(element) {
    total += element;
  });
  return total;
}

function permutationsCount(set) {
  return factorial(elementCount(set));
}

function permutationRepetitionFactor(set) {
  var total = 1;
  set.forEach(function(element) {
    total *= factorial(element);
  })
  return total;
}

function permutationsWithoutRepetitionsCount(set) {
  return permutationsCount(set) / permutationRepetitionFactor(set);
}

function equalDivisorsOfSet(set) {
  var max = Math.max.apply(Math, set);
  var equalDivisors = [];
  var isEqualDivisor;

  for (var i = 2; i <= max; i++) {
    isEqualDivisor = true;
    set.forEach(function(element) {
      if (element % i !== 0) isEqualDivisor = false;
    });
    if (isEqualDivisor) equalDivisors.push(i);
  }

  return equalDivisors;
}

function setReductions(set) {
  var equalDivisors = equalDivisorsOfSet(set);
  var setReductions = [];
  var reducedSet;

  equalDivisors.forEach(function(divisor) {
    reducedSet = [];
    set.forEach(function(element) {
      reducedSet.push(element / divisor);
    })
    setReductions.push(reducedSet)
  })

  return setReductions;
}

function sumAcrossReducedSets(fn, set) {
  var sum = 0;

  setReductions(set).forEach(function(reducedSet) {
    sum += fn(reducedSet);
  });

  return sum;
}

function redundanciesToEliminate(set) {
  return sumAcrossReducedSets(permutationCountWithRedundanciesEliminated, set);
}

function permutationCountWithRedundanciesEliminated(set) {
  return permutationsWithoutRepetitionsCount(set) - redundanciesToEliminate(set);
}

function permutationCountWithRedundanciesEliminatedPerElement(set) {
  return permutationCountWithRedundanciesEliminated(set) / elementCount(set);
}

function normalOrderCount(set) {
  var count = permutationCountWithRedundanciesEliminatedPerElement(set);
  count += sumAcrossReducedSets(permutationCountWithRedundanciesEliminatedPerElement, set);
  return count;
}

console.log(normalOrderCount(scalarSet));
