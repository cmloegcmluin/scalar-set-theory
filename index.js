var React = require('react');
var ReactDOM = require('react-dom');
var Entry = require('./entry.js');

const root = document.createElement('div');
document.body.appendChild(root)
ReactDOM.render(<Entry />, root);
