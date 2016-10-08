import React from 'react';

export default class ScalarInput extends React.Component {
  handleChange(component, event) {
    console.log(component)
    component.props.store.dispatch({ type: 'INCREMENT' });
  }

  render() {
    console.log(this)
    return <input onChange={() => this.handleChange(this)}/>;
  }
}
