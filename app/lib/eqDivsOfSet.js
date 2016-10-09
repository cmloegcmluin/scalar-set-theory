import range from '../helpers/range'

const maxOfSet = set => Math.max.apply(Math, set)

//range of potential equal divisors
const potEqDivRange = set => range(maxOfSet(set) - 1, 2)

//does this n divide evenly into each element of the set?
const isEqDivOfSet = (set, n) => set.every(el => el % n === 0)

//equal divisors of set
export default set => potEqDivRange(set).filter(n => isEqDivOfSet(set, n))