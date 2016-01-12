import React, { PropTypes } from 'react';
import FieldFormButtonsComponent from '../components/FieldFormButtonsComponent';

export default class FieldFormButtonsContainer extends React.Component {
  static propTypes = {
    id: PropTypes.number,
    title: PropTypes.string.isRequired,
    onHide: PropTypes.func.isRequired
  };

  fieldIsInvalid() {
    return this.props.title.length == 0;
  }

  fieldIsNew() {
    return this.props.id == null;
  }

  render() {
    return (
      <FieldFormButtonsComponent
        fieldIsInvalid={this.fieldIsInvalid()}
        fieldIsNew={this.fieldIsNew()}
        onHide={this.props.onHide} />
    );
  }
}
