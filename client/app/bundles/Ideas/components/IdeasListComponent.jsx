import React, { PropTypes } from 'react';
import IdeaContainer from '../containers/IdeaContainer';

export default class IdeasListComponent extends React.Component {
  static propTypes = {
    ideas: PropTypes.array.isRequired
  };

  render() {
    var ideas = [];

    this.props.ideas.map(function(idea, index) {
      ideas.push(<IdeaContainer key={index} idea={idea} />);
    });

    return (
      <ul id="ideas" className="flex-grid">
        {ideas}
      </ul>
    );
  }
}
