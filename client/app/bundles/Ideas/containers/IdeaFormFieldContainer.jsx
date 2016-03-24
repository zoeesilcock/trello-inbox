import React, { PropTypes } from 'react';

import FieldValuesActions from '../actions/FieldValuesActions';
import IdeaFormFieldComponent from '../components/IdeaFormFieldComponent';

export class IdeaFormFieldContainer extends React.Component {
  static propTypes = {
    field: PropTypes.object.isRequired,
    index: PropTypes.number.isRequired,
  };

  constructor() {
    super();

    this.fieldChanged = this.fieldChanged.bind(this);
  }

  fieldChanged(event) {
    FieldValuesActions.changeFieldValue(
        this.props.index, event.target.value, this.props.field.required);
  }

  render() {
    return (
      <IdeaFormFieldComponent
        id={this.props.field.id}
        title={this.props.field.title}
        description={this.props.field.description}
        value={this.props.field.value}
        required={this.props.field.required}
        onChange={this.fieldChanged}
      />
    );
  }
}

export default IdeaFormFieldContainer;
