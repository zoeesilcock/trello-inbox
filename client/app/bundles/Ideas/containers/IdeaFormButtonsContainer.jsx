import React, { PropTypes } from 'react';

import IdeaFormButtonsComponent from '../components/IdeaFormButtonsComponent';

export class IdeaFormButtonsContainer extends React.Component {
  static propTypes = {
    id: PropTypes.number,
    title: PropTypes.string.isRequired,
    onHide: PropTypes.func.isRequired,
    fields: PropTypes.array.isRequired,
  };

  ideaIsInvalid() {
    let fieldsValid = true;

    this.props.fields.forEach((field) => {
      if (!field.valid) {
        fieldsValid = false;
      }
    });

    return this.props.title.length === 0 || !fieldsValid;
  }

  ideaIsNew() {
    return this.props.id === null;
  }

  render() {
    return (
      <IdeaFormButtonsComponent
        ideaIsInvalid={this.ideaIsInvalid()}
        ideaIsNew={this.ideaIsNew()}
        onHide={this.props.onHide}
      />
    );
  }
}

export default IdeaFormButtonsContainer;
