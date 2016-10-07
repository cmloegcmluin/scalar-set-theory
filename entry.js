var React = require('react');
var NormalOrderCounter = require('./normalOrderCounter.js');

class Entry extends React.Component {
  render() {
    return <NormalOrderCounter scalarSet={[1, 2, 1]}/>
  }
}

module.exports = Entry;
