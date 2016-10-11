import React from 'react'
import ReactDOM from 'react-dom'
import {createStore} from 'redux'
import {Provider} from 'react-redux'

import initialState from './initialState'

import App from '../components/app'

function rootReducer(state = initialState, action) {
  let newState = {
    scalarCount: state.scalarCount,
    scalarSet: state.scalarSet.slice()
  } 

  switch (action.type) {
  case 'SET_SCALAR_INPUT_COUNT':
    const count = parseInt(action.data)
    newState.scalarCount = count
    if (count < newState.scalarSet.length) {
      newState.scalarSet = newState.scalarSet.splice(0, count)
    }
    while (count > newState.scalarSet.length) {
      newState.scalarSet.push(0)
    }
  case 'UPDATE_SCALAR':
    const {index, val} = action.data
    if (index === undefined) break
    newState.scalarSet[index] = parseInt(val)
  default:
  }
  return newState;
}

export default root => {
  let state = createStore(rootReducer)
  state.subscribe(() => {
    ReactDOM.render(<Provider store={state}><App/></Provider>, root)
  })
  state.dispatch({type: 'WAKE_UP'})
}