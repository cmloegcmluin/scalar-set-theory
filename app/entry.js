import React from 'react'
import {render} from 'react-dom'
import {createStore} from 'redux'
import {Provider} from 'react-redux'

import App from './components/app'
import rootReducer from './reducers/rootReducer'

import './stylesheets/styles.css'

const root = document.createElement('div')
document.body.appendChild(root)

console.log(process.env.NODE_ENV === 'production' ? 'wassup' : 'wasabi')

let state = createStore(rootReducer)
state.subscribe(() => {
	render(<Provider {...{store: state, children: <App/>}}/>, root)
})
state.dispatch({type: 'WAKE_UP'})