import React, { PropTypes } from 'react';
import IdeaComponent from '../components/IdeaComponent';

export default class IdeaContainer extends React.Component {
  static propTypes = {
    idea: PropTypes.object.isRequired
  }

  render() {
    return (
      <IdeaComponent idea={this.props.idea} />
    );
  }
}
