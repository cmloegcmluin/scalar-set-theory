import React from 'react'
import ReactDOM from 'react-dom'
import {createStore} from 'redux'
import {Provider} from 'react-redux'

import initialState from './initialState'

import App from '../components/app'

function rootReducer(state = initialState, action) {
  switch (action.type) {
  case 'SET_SCALAR_INPUT_COUNT':
    const count = parseInt(action.data)
    if (count) {
      return state
        .set('scalarCount', count)
        .set('scalarCountDisplay', count)
        .set('scalarSet', state.get('scalarSet').setSize(count))
    }
    return state
      .set('scalarCountDisplay', '')
  case 'UPDATE_SCALAR':
    const {index, val} = action.data
    return state
      .set('scalarSet', state.get('scalarSet').set(index, parseInt(val || 0)))   
  default:
    return state
  }
}

export default root => {
  let state = createStore(rootReducer)
  state.subscribe(() => {
    ReactDOM.render(<Provider store={state}><App/></Provider>, root)
  })
  state.dispatch({type: 'WAKE_UP'})
}