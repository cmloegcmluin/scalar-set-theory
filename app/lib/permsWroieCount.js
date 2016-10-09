import elementCount from './elementCount'

const fact = n => n <= 1 ? 1 : n * fact(n - 1)

const permsCount = set => fact(elementCount(set))

//indistiguishable element repetition factor
const indistElRepFact = set => set.reduce((m, n) => m * fact(n), 1)

//perms with repetition of indistinguishable elements count
export default set => permsCount(set) / indistElRepFact(set)
