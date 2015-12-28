import React from 'react';
import { Button } from 'react-bootstrap';

export default class NewFieldButtonComponent extends React.Component {
  render() {
    return (
      <Button className="btn btn-primary pull-right" onClick={this.props.openModal}>
        {I18n.t('fields.index.new_field')}
      </Button>
    );
  }
}
