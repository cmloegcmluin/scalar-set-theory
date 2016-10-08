import React from 'react';

export default class ScalarCountInput extends React.Component {
  handleChange(component, event) {
    console.log(event)
    component.props.store.dispatch({ type: 'SET_COUNT', data: event.target.value });
  }

  render() {
    return <input onChange={(event) => this.handleChange(this, event)}/>;
  }
}
