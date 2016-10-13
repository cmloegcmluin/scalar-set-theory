import elementCount from '../helpers/elementCount'
import sumAcrSetReds from './sumAcrSetReds'
import permCountWre from './permCountWre'

//perm count with redundancies eliminated per element
const permCountWrepe = set => permCountWre(set) / elementCount(set)

export default set => Math.round(permCountWrepe(set) + sumAcrSetReds(permCountWrepe, set))
