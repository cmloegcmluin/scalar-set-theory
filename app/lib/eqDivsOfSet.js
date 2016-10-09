import range from './range'

const maxOfSet = set => Math.max.apply(Math, set)

//equal divisors range
const eqDivRange = set => range(maxOfSet(set) - 1, 2)

//does this n divide evenly into each element of the set?
const isEqDivOfSet = (set, n) => set.every(el => el % n === 0)

//equal divisors of set
export default set => eqDivRange(set).filter(n => isEqDivOfSet(set, n))