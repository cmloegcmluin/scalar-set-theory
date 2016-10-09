import range from './range'

const maxOfSet = set => Math.max.apply(Math, set)

//equal divisors range
const eqDivRange = set => range(maxOfSet(set) - 1, 2)

//does this n divide evenly into each element of the set?
const isEqDivOfSet = (set, n) => set.every(el => el % n === 0)

//equal divisors of set
const eqDivsOfSet = set => eqDivRange(set).filter(n => isEqDivOfSet(set, n))

//a set reduction
const setRed = (set, div) => set.map(el => el / div)

//all set reductions
const setReds = set => eqDivsOfSet(set).map(div => setRed(set, div))

//sum of results of calling a function on all elements of all set reductions
export default (fn, set) => setReds(set).reduce((m, setRed) => m += fn(setRed), 0)