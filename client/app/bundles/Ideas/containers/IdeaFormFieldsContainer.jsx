import React, { PropTypes } from 'react';

import IdeaFormFieldsComponent from '../components/IdeaFormFieldsComponent';
import IdeaActions from '../actions/IdeaActions';
import FieldValuesActions from '../actions/FieldValuesActions';

export class IdeaFormFieldsContainer extends React.Component {
  static propTypes = {
    title: PropTypes.string,
    fields: PropTypes.array.isRequired,
  };

  constructor() {
    super();

    this.titleChanged = this.titleChanged.bind(this);
    this.fieldChanged = this.fieldChanged.bind(this);
  }

  titleChanged(event) {
    IdeaActions.updateTitle(event.target.value);
  }

  fieldChanged(event) {
    FieldValuesActions.fieldChanged(event.target.value);
  }

  render() {
    return (
      <IdeaFormFieldsComponent
        title={this.props.title}
        fields={this.props.fields}
        onTitleChange={this.titleChanged}
      />
    );
  }
}

export default IdeaFormFieldsContainer;
