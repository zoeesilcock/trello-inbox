import React, { PropTypes } from 'react';

import IdeasListContainer from '../containers/IdeasListContainer';

export class ListComponent extends React.Component {
  static propTypes = {
    list: PropTypes.object.isRequired,
    ideas: PropTypes.array.isRequired,
  };

  render() {
    let ideas = (<div>{I18n.t('ideas.index.no_ideas')}</div>);

    if (this.props.ideas.length > 0) {
      ideas = (
        <IdeasListContainer ideas={this.props.ideas} />
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

export default ListComponent;
