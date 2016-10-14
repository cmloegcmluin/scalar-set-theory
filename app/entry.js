import React from 'react'
import {render} from 'react-dom'
import {createStore} from 'redux'
import {Provider} from 'react-redux'

import App from './components/app'
import reducer from './reducers/reducer'

const root = document.createElement('div')
document.body.appendChild(root)

let state = createStore(reducer)
state.subscribe(() => {
	render(<Provider {...{store: state, children: <App/>}}/>, root)
})
state.dispatch({type: 'WAKE_UP'})