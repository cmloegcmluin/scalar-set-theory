import {createStore} from 'redux'
import React from 'react'
import ReactDOM from 'react-dom'
import Entry from './app/components/entry'
import initialState from './initialState'

function counter(state = initialState, action) {
  switch (action.type) {
  case 'SET_SCALAR_INPUT_COUNT':
    const count = parseInt(action.data)
    state.scalarCount = count
    if (count < state.scalarSet.length) {
      state.scalarSet = state.scalarSet.splice(0, count)
    }
    while (count > state.scalarSet.length) {
      state.scalarSet.push(0)
    }
  case 'UPDATE_SCALAR':
    const {index, val} = action.data
    if (index === undefined) break
    state.scalarSet[index] = parseInt(val)
  default:
  }
  // console.log(state.scalarSet)
  return state;
}

export default root => {
  let state = createStore(counter)
  state.subscribe(() => ReactDOM.render(<Entry state={state}/>, root))
  state.dispatch({ type: 'WAKEUP' })
}