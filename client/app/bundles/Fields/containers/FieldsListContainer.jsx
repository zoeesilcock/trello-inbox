import React, { PropTypes } from 'react';
import FieldsListComponent from '../components/FieldsListComponent';

export default class FieldsListContainer extends React.Component {
  static propTypes = {
    fields: PropTypes.array.isRequired
  }

  render() {
    return (
      <FieldsListComponent fields={this.props.fields} />
    );
  }
}
