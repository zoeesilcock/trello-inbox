import React, { PropTypes } from 'react';
import { Button } from 'react-bootstrap';

export class NewFieldButtonComponent extends React.Component {
  static propTypes = {
    openModal: PropTypes.func.isRequired,
  };

  render() {
    return (
      <Button className="btn btn-primary pull-right" onClick={this.props.openModal}>
        {I18n.t('fields.index.new_field')}
      </Button>
    );
  }
}

export default NewFieldButtonComponent;
