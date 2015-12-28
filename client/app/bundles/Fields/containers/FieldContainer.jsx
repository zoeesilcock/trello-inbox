import React, { PropTypes } from 'react';
import FieldComponent from '../components/FieldComponent';
import FieldsActions from '../actions/FieldsActions';

export default class FieldContainer extends React.Component {
  static propTypes = {
    field: PropTypes.object.isRequired,
    index: PropTypes.number.isRequired
  }

  onTitleChanged(event) {
    FieldsActions.updateTitle(this.props.index, event.target.value);
  }

  onEdit(event) {
    FieldsActions.pickField(this.props.index);
    FieldsActions.updateShowModal(true);
  }

  render() {
    return (
      <FieldComponent
        field={this.props.field}
        editField={this.onEdit.bind(this)} />
    );
  }
}
