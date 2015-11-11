import React from 'react';
import connectToStores from 'alt/utils/connectToStores';
import IdeasSortComponent from '../components/IdeasSortComponent';
import IdeasSortActions from '../actions/IdeasSortActions';
import IdeasSortStore from '../stores/IdeasSortStore';

class IdeasSortContainer extends React.Component {
  static getStores() {
    return [IdeasSortStore];
  }

  static getPropsFromStores() {
    return IdeasSortStore.getState();
  }

  onChange(event) {
    IdeasSortActions.updateSort(event.target.value);
  }

  render() {
    return (
      <IdeasSortComponent sort={this.props.sort} onChange={this.onChange} />
    );
  }
}

export default connectToStores(IdeasSortContainer);
