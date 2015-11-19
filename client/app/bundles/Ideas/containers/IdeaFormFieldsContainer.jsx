import React, { PropTypes } from 'react';
import IdeaFormFieldsComponent from '../components/IdeaFormFieldsComponent';
import IdeaActions from '../actions/IdeaActions';

export default class IdeaFormFieldsContainer extends React.Component {
  static propTypes = {
    title: PropTypes.string,
    description: PropTypes.string
  }

  titleChanged(event) {
    IdeaActions.updateTitle(event.target.value);
  }

  descriptionChanged(event) {
    IdeaActions.updateDescription(event.target.value);
  }

  render() {
    return (
      <IdeaFormFieldsComponent
        title={this.props.title}
        description={this.props.description}
        onTitleChange={this.titleChanged}
        onDescriptionChange={this.descriptionChanged} />
    );
  }
}
