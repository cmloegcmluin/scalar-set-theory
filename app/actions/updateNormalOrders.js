import normalOrdersList from '../lib/normalOrdersList'

export default async (dispatch, scalarSet) => {
	const normalOrdersPromise = new Promise(resolve => {
		setTimeout(() => {
			resolve(normalOrdersList.getList(scalarSet))
		}, 0)
	})
	const data = await normalOrdersPromise
	dispatch({type: 'UPDATE_NORMAL_ORDERS', data})
}