import React, { PropTypes } from 'react';
import FieldComponent from '../components/FieldComponent';
import FieldActions from '../actions/FieldActions';

export default class FieldContainer extends React.Component {
  static propTypes = {
    field: PropTypes.object.isRequired,
    index: PropTypes.number.isRequired
  }

  onEdit(event) {
    FieldActions.updateId(this.props.field.id);
    FieldActions.updateTitle(this.props.field.title);
    FieldActions.updateDescription(this.props.field.description);
    FieldActions.updateRequired(this.props.field.required);
    FieldActions.updateShowModal(true);
  }

  render() {
    return (
      <FieldComponent
        field={this.props.field}
        editField={this.onEdit.bind(this)} />
    );
  }
}
