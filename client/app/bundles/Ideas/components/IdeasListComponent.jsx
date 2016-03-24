import React, { PropTypes } from 'react';

import IdeaContainer from '../containers/IdeaContainer';

export class IdeasListComponent extends React.Component {
  static propTypes = {
    ideas: PropTypes.array.isRequired,
  };

  render() {
    const ideas = [];

    this.props.ideas.forEach((idea, index) => {
      ideas.push(<IdeaContainer key={index} idea={idea} />);
    });

    return (
      <ul id="ideas" className="flex-grid">
        {ideas}
      </ul>
    );
  }
}

export default IdeasListComponent;
