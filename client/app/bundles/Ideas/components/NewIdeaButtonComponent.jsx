import React from 'react';
import { Button } from 'react-bootstrap';

export default class NewIdeaButtonComponent extends React.Component {
  render() {
    return (
      <Button className="btn btn-success navbar-btn" onClick={this.props.openModal}>
        {I18n.t('layouts.navigation.new_idea')}
      </Button>
    );
  }
}
