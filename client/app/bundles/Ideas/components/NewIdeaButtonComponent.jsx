import React, { PropTypes } from 'react';
import { Button } from 'react-bootstrap';

export class NewIdeaButtonComponent extends React.Component {
  static propTypes = {
    openModal: PropTypes.func.isRequired,
  };

  render() {
    return (
      <Button className="btn btn-success navbar-btn" onClick={this.props.openModal}>
        {I18n.t('layouts.navigation.new_idea')}
      </Button>
    );
  }
}

export default NewIdeaButtonComponent;
