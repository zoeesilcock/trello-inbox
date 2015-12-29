import React, { PropTypes } from 'react';
import IdeaFormFieldsComponent from '../components/IdeaFormFieldsComponent';
import IdeaActions from '../actions/IdeaActions';
import FieldValuesActions from '../actions/FieldValuesActions';

export default class IdeaFormFieldsContainer extends React.Component {
  static propTypes = {
    title: PropTypes.string,
    description: PropTypes.string,
    fields: PropTypes.array.isRequired
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
        onTitleChange={this.titleChanged} />
    );
  }
}
