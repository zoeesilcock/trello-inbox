import React, { PropTypes } from 'react';
import IdeasHeaderContainer from './IdeasHeaderContainer';
import IdeasListContainer from './IdeasListContainer';

export default class IdeasContainer extends React.Component {
  static propTypes = {
    ideas: PropTypes.array.isRequired
  }

  render() {
    return (
      <div>
        <IdeasHeaderContainer />
        <hr />
        <IdeasListContainer ideas={this.props.ideas} />
      </div>
    );
  }
}
