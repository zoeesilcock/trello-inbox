import React, { PropTypes } from 'react';

import FieldComponent from '../components/FieldComponent';
import FieldActions from '../actions/FieldActions';
import FieldsActions from '../actions/FieldsActions';

export class FieldContainer extends React.Component {
  static propTypes = {
    field: PropTypes.object.isRequired,
    index: PropTypes.number.isRequired,
  };

  constructor() {
    super();

    this.onEdit = this.onEdit.bind(this);
    this.onRemove = this.onRemove.bind(this);
  }

  onEdit() {
    FieldActions.updateId(this.props.field.id);
    FieldActions.updateTitle(this.props.field.title);
    FieldActions.updateDescription(this.props.field.description);
    FieldActions.updateRequired(this.props.field.required);
    FieldActions.updateShowModal(true);
  }

  onRemove() {
    FieldsActions.removeField(this.props.index);
  }

  render() {
    return (
      <FieldComponent
        field={this.props.field}
        index={this.props.index}
        editField={this.onEdit}
        removeField={this.onRemove}
      />
    );
  }
}

export default FieldContainer;
