import React from 'react';
import NormalOrderCounter from './normalOrderCounter';
import ScalarCountInput from './scalarCountInput';
import ScalarInputs from './scalarInputs';

export default class Entry extends React.Component {
  render() {
    console.log(this.props.store)
    return (
      <div>
        How many scalars? <ScalarCountInput store={this.props.store}/>
        <ScalarInputs store={this.props.store} scalarInputCount={this.props.store.getState()}/>
        <NormalOrderCounter scalarSet={[20, 20]}/>
      </div>
    );
  }
}
