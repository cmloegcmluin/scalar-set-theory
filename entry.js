var React = require('react');
var NormalOrderCounter = require('./normalOrderCounter.js');

class Entry extends React.Component {
  render() {
    return <NormalOrderCounter scalarSet={[20, 20]}/>
  }
}

module.exports = Entry;
