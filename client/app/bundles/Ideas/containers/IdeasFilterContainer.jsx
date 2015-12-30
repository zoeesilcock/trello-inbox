import React from 'react';
import connectToStores from 'alt-utils/lib/connectToStores';
import IdeasFilterComponent from '../components/IdeasFilterComponent';
import IdeasFilterActions from '../actions/IdeasFilterActions';
import IdeasFilterStore from '../stores/IdeasFilterStore';

class IdeasFilterContainer extends React.Component {
  static getStores() {
    return [IdeasFilterStore];
  }

  static getPropsFromStores() {
    return IdeasFilterStore.getState();
  }

  onChange(event) {
    IdeasFilterActions.updateFilter(event.target.value);
  }

  render() {
    return (
      <IdeasFilterComponent filter={this.props.filter} onChange={this.onChange} />
    );
  }
}

export default connectToStores(IdeasFilterContainer);
