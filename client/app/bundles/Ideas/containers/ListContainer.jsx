import React, { PropTypes } from 'react';
import connectToStores from 'alt-utils/lib/connectToStores';
import ListComponent from '../components/ListComponent';
import IdeasStore from '../stores/IdeasStore';

export class ListContainer extends React.Component {
  static propTypes = {
    list: PropTypes.object.isRequired
  };

  static getStores() {
    return [IdeasStore];
  }

  static getPropsFromStores() {
    return IdeasStore.getState();
  }

  getListIdeas() {
    var list_id = this.props.list.list_id;
    return this.props.ideas.filter(function(i) { return i.list_id == list_id });
  }

  render() {
    return (
      <ListComponent list={this.props.list} ideas={this.getListIdeas()} index={this.props.index} />
    );
  }
}

export default connectToStores(ListContainer);
