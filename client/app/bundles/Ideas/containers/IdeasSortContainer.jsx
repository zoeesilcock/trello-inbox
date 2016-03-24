import React, { PropTypes } from 'react';
import connectToStores from 'alt-utils/lib/connectToStores';

import IdeasSortComponent from '../components/IdeasSortComponent';
import IdeasSortActions from '../actions/IdeasSortActions';
import IdeasSortStore from '../stores/IdeasSortStore';

class IdeasSortContainer extends React.Component {
  static propTypes = {
    sort: PropTypes.string.isRequired,
  };

  static getStores() {
    return [IdeasSortStore];
  }

  static getPropsFromStores() {
    return IdeasSortStore.getState();
  }

  constructor() {
    super();

    this.onChange = this.onChange.bind(this);
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
