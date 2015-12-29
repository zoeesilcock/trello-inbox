import React, { PropTypes } from 'react';
import FieldValuesActions from '../actions/FieldValuesActions';
import IdeaFormFieldComponent from '../components/IdeaFormFieldComponent';

export default class IdeaFormFieldContainer extends React.Component {
  static propTypes = {
    field: PropTypes.object.isRequired,
    index: PropTypes.number.isRequired
  }

  fieldChanged(event) {
    FieldValuesActions.changeFieldValue(this.props.index, event.target.value);
  }

  render() {
    return(
      <IdeaFormFieldComponent
        id={this.props.field.id}
        title={this.props.field.title}
        description={this.props.field.description}
        value={this.props.field.value}
        onChange={this.fieldChanged.bind(this)}
      />
    );
  }
}
