import React, { PropTypes } from 'react';
import IdeasListContainer from '../containers/IdeasListContainer';

export default class ListComponent extends React.Component {
  static propTypes = {
    list: PropTypes.object.isRequired,
    ideas: PropTypes.array.isRequired
  };

  render() {
    if (this.props.ideas.length > 0) {
      var ideas = (
        <IdeasListContainer ideas={this.props.ideas} index={this.props.index} />
      );
    } else {
      var ideas = (
        <div>{I18n.t('ideas.index.no_ideas')}</div>
      );
    }

    return (
      <div>
        <h2>{this.props.list.title}</h2>
        {ideas}
      </div>
    );
  }
}
