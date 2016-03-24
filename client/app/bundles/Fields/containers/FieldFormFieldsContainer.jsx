import React, { PropTypes } from 'react';
import FieldFormFieldsComponent from '../components/FieldFormFieldsComponent';
import FieldActions from '../actions/FieldActions';

export class FieldFormFieldsContainer extends React.Component {
  static propTypes = {
    title: PropTypes.string,
    description: PropTypes.string,
    required: PropTypes.bool,
  };

  constructor() {
    super();

    this.titleChanged = this.titleChanged.bind(this);
    this.descriptionChanged = this.descriptionChanged.bind(this);
    this.requiredChanged = this.requiredChanged.bind(this);
  }

  titleChanged(event) {
    FieldActions.updateTitle(event.target.value);
  }

  descriptionChanged(event) {
    FieldActions.updateDescription(event.target.value);
  }

  requiredChanged(event) {
    FieldActions.updateRequired(event.target.checked);
  }

  render() {
    return (
      <FieldFormFieldsComponent
        title={this.props.title}
        description={this.props.description}
        required={this.props.required}
        onTitleChange={this.titleChanged}
        onDescriptionChange={this.descriptionChanged}
        onRequiredChange={this.requiredChanged}
      />
    );
  }
}

export default FieldFormFieldsContainer;
