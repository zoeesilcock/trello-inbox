import React, { PropTypes } from 'react';
import connectToStores from 'alt-utils/lib/connectToStores';

import ListComponent from '../components/ListComponent';
import IdeasStore from '../stores/IdeasStore';

export class ListContainer extends React.Component {
  static propTypes = {
    list: PropTypes.object.isRequired,
    ideas: PropTypes.array.isRequired,
  };

  static getStores() {
    return [IdeasStore];
  }

  static getPropsFromStores() {
    return IdeasStore.getState();
  }

  getListIdeas() {
    const listId = this.props.list.list_id;

    return this.props.ideas.filter((i) => i.list_id === listId);
  }

  render() {
    return (
      <ListComponent
        list={this.props.list}
        ideas={this.getListIdeas()}
      />
    );
  }
}

export default connectToStores(ListContainer);
