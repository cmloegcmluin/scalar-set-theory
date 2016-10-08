import React from 'react';

export default class ScalarInput extends React.Component {
  handleChange(component, event) {
    component.props.store.dispatch({ type: 'INCREMENT' });
  }

  render() {
    return <input onChange={() => this.handleChange(this)}/>;
  }
}
