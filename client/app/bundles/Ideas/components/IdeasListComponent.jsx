import React, { PropTypes } from 'react';
import IdeaComponent from './IdeaComponent';

export default class IdeasListComponent extends React.Component {
  static propTypes = {
    ideas: PropTypes.array.isRequired
  }

  render() {
    var ideas = [];
    this.props.ideas.map(function(idea, index) {
      ideas.push(<IdeaComponent key={index} idea={idea} />);
    });

    return (
      <ul id="ideas" className="row">
        {ideas}
      </ul>
    );
  }
}
