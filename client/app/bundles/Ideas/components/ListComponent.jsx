import React, { PropTypes } from 'react';
import { Panel } from 'react-bootstrap';
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
      <div className="list-container">
        <div className="list-header">
          <h2 className="text-center">{this.props.list.title}</h2>
          <hr />
        </div>

        {ideas}
      </div>
    );
  }
}
