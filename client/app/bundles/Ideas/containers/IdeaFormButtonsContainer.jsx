import React, { PropTypes } from 'react';
import NewIdeaButtonsComponent from '../components/NewIdeaButtonsComponent';

export default class NewIdeaButtonsContainer extends React.Component {
  static propTypes = {
    title: PropTypes.string.isRequired,
    description: PropTypes.string.isRequired
  }

  ideaIsInvalid() {
    return this.props.title.length == 0 || this.props.description.length == 0
  }

  render() {
    return (
      <NewIdeaButtonsComponent ideaIsInvalid={this.ideaIsInvalid()} />
    );
  }
}
