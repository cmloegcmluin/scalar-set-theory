import normalOrdersList from '../lib/normalOrdersList'
import fetch from 'isomorphic-fetch'
import queryString from 'query-string'

export default async (dispatch, scalarSet) => {
	const rawData = await fetch(`http://localhost:3000/normal-orders/${queryString.stringify(scalarSet)}`)
	const data = await rawData.json()
	dispatch({type: 'UPDATE_NORMAL_ORDERS', data})
}