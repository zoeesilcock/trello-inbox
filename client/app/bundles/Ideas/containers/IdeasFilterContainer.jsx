import React, { PropTypes } from 'react';
import connectToStores from 'alt-utils/lib/connectToStores';

import IdeasFilterComponent from '../components/IdeasFilterComponent';
import IdeasFilterActions from '../actions/IdeasFilterActions';
import IdeasFilterStore from '../stores/IdeasFilterStore';

class IdeasFilterContainer extends React.Component {
  static propTypes = {
    filter: PropTypes.string.isRequired,
  };

  static getStores() {
    return [IdeasFilterStore];
  }

  static getPropsFromStores() {
    return IdeasFilterStore.getState();
  }

  constructor() {
    super();

    this.onChange = this.onChange.bind(this);
  }

  onChange(event) {
    IdeasFilterActions.updateFilter(event.target.value);
  }

  render() {
    return (
      <IdeasFilterComponent
        filter={this.props.filter}
        onChange={this.onChange}
      />
    );
  }
}

export default connectToStores(IdeasFilterContainer);
