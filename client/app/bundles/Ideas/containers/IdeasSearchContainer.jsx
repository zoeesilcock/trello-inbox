import React, { PropTypes } from 'react';
import connectToStores from 'alt-utils/lib/connectToStores';

import IdeasSearchComponent from '../components/IdeasSearchComponent';
import IdeasSearchActions from '../actions/IdeasSearchActions';
import IdeasSearchStore from '../stores/IdeasSearchStore';

class IdeasSearchContainer extends React.Component {
  static propTypes = {
    search: PropTypes.string.isRequired,
  };

  static getStores() {
    return [IdeasSearchStore];
  }

  static getPropsFromStores() {
    return IdeasSearchStore.getState();
  }

  constructor() {
    super();

    this.onChange = this.onChange.bind(this);
  }

  onChange(event) {
    IdeasSearchActions.updateSearch(event.target.value);
  }

  render() {
    return (
      <IdeasSearchComponent search={this.props.search} onChange={this.onChange} />
    );
  }
}

export default connectToStores(IdeasSearchContainer);
