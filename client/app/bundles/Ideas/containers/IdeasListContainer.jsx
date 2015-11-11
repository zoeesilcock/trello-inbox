import React, { PropTypes } from 'react';
import connectToStores from 'alt/utils/connectToStores';
import IdeasListComponent from '../components/IdeasListComponent';
import IdeasFilterStore from '../stores/IdeasFilterStore';
import IdeasSortStore from '../stores/IdeasSortStore';

class IdeasListContainer extends React.Component {
  static propTypes = {
    ideas: PropTypes.array.isRequired
  }

  static getStores() {
    return [IdeasFilterStore, IdeasSortStore];
  }

  static getPropsFromStores() {
    return Object.assign(IdeasFilterStore.getState(), IdeasSortStore.getState());
  }

  sortIdeas() {
    if (this.props.sort == 'date') {
      return this.props.ideas.sort((a, b) => {
        return b.created_at - a.created_at;
      });
    } else if (this.props.sort == 'title') {
      return this.props.ideas.sort((a, b) => {
        return a.title.localeCompare(b.title);
      });
    } else {
      return this.props.ideas.sort((a, b) => {
        return b.id - a.id;
      });
    }
  }

  filterIdeas() {
    if (this.props.filter == 'mine') {
      return this.sortIdeas().filter(function(i) { return i.owned });
    } else {
      return this.sortIdeas();
    }
  }

  render() {
    return (
      <IdeasListComponent ideas={this.filterIdeas()} />
    );
  }
}

export default connectToStores(IdeasListContainer);
