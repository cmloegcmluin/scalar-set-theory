import React from 'react';
import normalOrderCount from '../lib/normalOrderCount';

export default class NormalOrderCounter extends React.Component {
  render() {
    return <div>And the count is: {normalOrderCount(this.props.scalarSet)}</div>;
  }
}
