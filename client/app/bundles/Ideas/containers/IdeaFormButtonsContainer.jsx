import React, { PropTypes } from 'react';
import IdeaFormButtonsComponent from '../components/IdeaFormButtonsComponent';

export default class IdeaFormButtonsContainer extends React.Component {
  static propTypes = {
    id: PropTypes.number,
    title: PropTypes.string.isRequired,
    onHide: PropTypes.func.isRequired
  };

  ideaIsInvalid() {
    return this.props.title.length == 0
  }

  ideaIsNew() {
    return this.props.id == null;
  }

  render() {
    return (
      <IdeaFormButtonsComponent
        ideaIsInvalid={this.ideaIsInvalid()}
        ideaIsNew={this.ideaIsNew()}
        onHide={this.props.onHide} />
    );
  }
}
