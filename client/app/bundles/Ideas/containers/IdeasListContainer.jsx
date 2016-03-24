import React, { PropTypes } from 'react';
import connectToStores from 'alt-utils/lib/connectToStores';

import IdeasListComponent from '../components/IdeasListComponent';
import IdeasFilterStore from '../stores/IdeasFilterStore';
import IdeasSortStore from '../stores/IdeasSortStore';
import IdeasSearchStore from '../stores/IdeasSearchStore';

class IdeasListContainer extends React.Component {
  static propTypes = {
    ideas: PropTypes.array.isRequired,
    search: PropTypes.string.isRequired,
    filter: PropTypes.string.isRequired,
    sort: PropTypes.string.isRequired,
    index: PropTypes.object,
  };

  static getStores() {
    return [IdeasFilterStore, IdeasSortStore, IdeasSearchStore];
  }

  static getPropsFromStores() {
    return Object.assign({},
      IdeasFilterStore.getState(),
      IdeasSortStore.getState(),
      IdeasSearchStore.getState(),
    );
  }

  searchIdeas() {
    if (this.props.search.length >= 3) {
      const results = this.props.index.search(this.props.search);

      return this.props.ideas.filter((idea) => {
        for (let i = 0; i < results.length; i++) {
          if (results[i].ref === idea.id) {
            return true;
          }
        }

        return false;
      });
    }

    return this.props.ideas;
  }

  sortIdeas() {
    if (this.props.sort === 'date') {
      return this.searchIdeas().sort((a, b) => b.created_at - a.created_at);
    } else if (this.props.sort === 'title') {
      return this.searchIdeas().sort((a, b) => a.title.localeCompare(b.title));
    }

    return this.searchIdeas().sort((a, b) => b.id - a.id);
  }

  filterIdeas() {
    if (this.props.filter === 'mine') {
      return this.sortIdeas().filter((i) => i.owned);
    }

    return this.sortIdeas();
  }

  render() {
    const ideas = this.filterIdeas();
    let ideaList = I18n.t('ideas.index.no_matching_ideas');

    if (ideas.length > 0) {
      ideaList = (<IdeasListComponent ideas={ideas} />);
    }

    return (
      <div>
        {ideaList}
      </div>
    );
  }
}

export default connectToStores(IdeasListContainer);
