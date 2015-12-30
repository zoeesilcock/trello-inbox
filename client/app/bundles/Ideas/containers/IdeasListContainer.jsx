import React, { PropTypes } from 'react';
import connectToStores from 'alt-utils/lib/connectToStores';
import IdeasListComponent from '../components/IdeasListComponent';
import IdeasFilterStore from '../stores/IdeasFilterStore';
import IdeasSortStore from '../stores/IdeasSortStore';
import IdeasSearchStore from '../stores/IdeasSearchStore';

class IdeasListContainer extends React.Component {
  static propTypes = {
    ideas: PropTypes.array.isRequired
  }

  static getStores() {
    return [IdeasFilterStore, IdeasSortStore, IdeasSearchStore];
  }

  static getPropsFromStores() {
    return Object.assign({},
      IdeasFilterStore.getState(),
      IdeasSortStore.getState(),
      IdeasSearchStore.getState()
    );
  }

  searchIdeas() {
    if (this.props.search.length >= 3) {
      return this.props.index.search(this.props.search).map((result) => {
        for (var i = 0; i < this.props.ideas.length; i++) {
          if (this.props.ideas[i].id == result.ref) {
            return this.props.ideas[i];
          }
        }
      });
    } else {
      return this.props.ideas;
    }
  }

  sortIdeas() {
    if (this.props.sort == 'date') {
      return this.searchIdeas().sort((a, b) => {
        return b.created_at - a.created_at;
      });
    } else if (this.props.sort == 'title') {
      return this.searchIdeas().sort((a, b) => {
        return a.title.localeCompare(b.title);
      });
    } else {
      return this.searchIdeas().sort((a, b) => {
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
