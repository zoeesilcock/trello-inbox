import IdeasListComponent from '../components/IdeasListComponent';
import IdeasFilterStore from '../stores/IdeasFilterStore';
import connectToStores from 'alt/utils/connectToStores';
import React, { PropTypes } from 'react';

class IdeasListContainer extends React.Component {
  static propTypes = {
    ideas: PropTypes.array.isRequired
  }

  static getStores() {
    return [IdeasFilterStore];
  }

  static getPropsFromStores() {
    return IdeasFilterStore.getState();
  }

  filterIdeas() {
    if (this.props.filter == 'mine') {
      return this.props.ideas.filter(function(i) { return i.owned });
    } else {
      return this.props.ideas;
    }
  }

  render() {
    var ideas = this.filterIdeas();

    return (
      <IdeasListComponent ideas={this.filterIdeas()} />
    );
  }
}

export default connectToStores(IdeasListContainer);
