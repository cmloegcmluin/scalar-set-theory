import normalOrdersList from '../lib/normalOrdersList'
import fetch from 'isomorphic-fetch'
import queryString from 'query-string'

const apiUrl = process.env.NODE_ENV === 'production' ? 'https://scalar-set-theory-backend.cfapps.io' : 'http://localhost:3000';

export default async (dispatch, scalarSet) => {
	const rawData = await fetch(`${apiUrl}/normal-orders/${queryString.stringify(scalarSet)}`)
	const data = await rawData.json()
	dispatch({type: 'UPDATE_NORMAL_ORDERS', data})
}