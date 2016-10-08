import React from 'react';
import ScalarInput from './scalarInput';

export default class ScalarInputs extends React.Component {
  render() {
    const scalarInputs = [];
    times(this.props.scalarInputCount)(input => scalarInputs.push(<ScalarInput store={this.props.store} index={input} key={input}/>));
    return <div>{scalarInputs}</div>;
  }
}

const times = x => f => {
  if (x > 0) {
    f();
    times(x - 1)(f);
  }
}
