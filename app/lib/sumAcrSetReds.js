import eqDivsOfSet from './eqDivsOfSet'

//a set reduction
const setRed = (set, div) => set.map(el => el / div)

//all set reductions
const setReds = set => eqDivsOfSet(set).map(div => setRed(set, div))

//sum of results of calling a function on all elements of all set reductions
export default (fn, set) => setReds(set).reduce((m, setRed) => m += fn(setRed), 0)