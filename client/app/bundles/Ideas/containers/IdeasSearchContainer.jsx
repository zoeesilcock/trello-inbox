import React from 'react';
import connectToStores from 'alt/utils/connectToStores';
import IdeasSearchComponent from '../components/IdeasSearchComponent';
import IdeasSearchActions from '../actions/IdeasSearchActions';
import IdeasSearchStore from '../stores/IdeasSearchStore';

class IdeasSearchContainer extends React.Component {
  static getStores() {
    return [IdeasSearchStore];
  }

  static getPropsFromStores() {
    return IdeasSearchStore.getState();
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
