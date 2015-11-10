import React from 'react';
import IdeasFilterComponent from '../components/IdeasFilterComponent';
import IdeasFilterActions from '../actions/IdeasFilterActions';
import IdeasFilterStore from '../stores/IdeasFilterStore';

export default class IdeasFilterContainer extends React.Component {
  constructor(props) {
    super(props);
    this.state = IdeasFilterStore.getState();
  }

  onChange(event) {
    IdeasFilterActions.updateFilter(event.target.value);
  }

  render() {
    return (
      <IdeasFilterComponent filter={this.state.filter} onChange={this.onChange} />
    );
  }
}
