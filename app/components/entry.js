import React from 'react';
import NormalOrderCounter from './normalOrderCounter';

export default class Entry extends React.Component {
  render() {
    return <NormalOrderCounter scalarSet={[20, 20]}/>
  }
}
