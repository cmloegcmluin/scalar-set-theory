

// require("babel-core").transform("code", options);

// require("babel-polyfill");

var React = require('react');
var ReactDOMServer = require('react-dom/server');

class MyComponent extends React.Component {
  render() {
    return React.createElement(
      'div',
      null,
      'Hello World'
    );
  }
}

ReactDOMServer.renderToString(React.createElement(MyComponent, null));

var express = require('express');
var app = express();
var PORT = process.env.PORT || 3000;

app.use(express.static(__dirname));

app.get('/', function (req, res) {
  res.send(ReactDOMServer.renderToString(React.createElement(MyComponent, null)));
});

app.listen(PORT, function () {
  console.log('listening on ' + PORT);
});