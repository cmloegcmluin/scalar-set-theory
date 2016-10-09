import sumAcrSetReds from './sumAcrSetReds'
import permsWroieCount from './permsWroieCount'

const redundanciesToEliminate = set => sumAcrSetReds(permCountWre, set)

//perm count with redundancies eliminated
const permCountWre = set => permsWroieCount(set) - redundanciesToEliminate(set)

export default permCountWre