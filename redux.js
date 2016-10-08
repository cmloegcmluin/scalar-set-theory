import { createStore } from 'redux'
import React from 'react'
import ReactDOM from 'react-dom'
import Entry from './app/components/entry.js'

/**
 * This is a reducer, a pure function with (state, action) => state signature.
 * It describes how an action transforms the state into the next state.
 *
 * The shape of the state is up to you: it can be a primitive, an array, an object,
 * or even an Immutable.js data structure. The only important part is that you should
 * not mutate the state object, but return a new object if the state changes.
 *
 * In this example, we use a `switch` statement and strings, but you can use a helper that
 * follows a different convention (such as function maps) if it makes sense for your
 * project.
 */

let initialState = {
  scalarInputCount: 3,
  scalarSet: [1, 2, 1]
};
function counter(state = initialState, action) {
  switch (action.type) {
  case 'INCREMENT':
    state.scalarInputCount++;
    return state;
  case 'DECREMENT':
    state.scalarInputCount--;
    return state;
  case 'SET_COUNT':
    console.log(action.data)
    state.scalarInputCount = action.data;
    return state;
  default:
    return state;
  }
}

function run(root) {

// Create a Redux store holding the state of your app.
// Its API is { subscribe, dispatch, getState }.
let store = createStore(counter)

// You can use subscribe() to update the UI in response to state changes.
// Normally you'd use a view binding library (e.g. React Redux) rather than subscribe() directly.
// However it can also be handy to persist the current state in the localStorage.

store.subscribe(() =>
  // console.log(store.getState())
  ReactDOM.render(<Entry store={store}/>, root)
)

// The only way to mutate the internal state is to dispatch an action.
// The actions can be serialized, logged or stored and later replayed.
store.dispatch({ type: 'INCREMENT' })
// 1
store.dispatch({ type: 'INCREMENT' })
// 2
store.dispatch({ type: 'DECREMENT' })
// 1

}

export default run;
