import React from 'react';

export default class ScalarCountInput extends React.Component {
  handleChange(component, event) {
    component.props.store.dispatch({ type: 'DECREMENT' });
  }

  render() {
    return <input onChange={() => this.handleChange(this)}/>;
  }
}
