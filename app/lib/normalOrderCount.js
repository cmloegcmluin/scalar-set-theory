import elementCount from './elementCount'
import sumAcrSetReds from './sumAcrSetReds'
import permCountWre from './permCountWre'

//perm count with redundancies eliminated per element
const permCountWrepe = set => permCountWre(set) / elementCount(set)

export default set => permCountWrepe(set) + sumAcrSetReds(permCountWrepe, set)
