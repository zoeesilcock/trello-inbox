import IdeasListComponent from '../components/IdeasListComponent';
import React, { PropTypes } from 'react';

export default class IdeasListContainer extends React.Component {
  static propTypes = {
    ideas: PropTypes.array.isRequired
  }

  render() {
    return (
      <IdeasListComponent ideas={this.props.ideas} />
    );
  }
}
