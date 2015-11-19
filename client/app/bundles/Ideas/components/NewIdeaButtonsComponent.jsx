import React, { PropTypes } from 'react';
import { ButtonToolbar, Button } from 'react-bootstrap';

export default class NewIdeaButtonsComponent extends React.Component {
  static propTypes = {
    ideaIsValid: PropTypes.bool.isRequired,
  }

  render() {
    return (
      <div>
        <ButtonToolbar>
          <Button
            type="submit"
            className="pull-right"
            disabled={this.props.ideaIsInvalid}
            bsStyle="success">
            {I18n.t('ideas.form.create')}
          </Button>

          <Button
            className="pull-right"
            bsStyle="default"
            data-dismiss="modal">
            {I18n.t('ideas.form.cancel')}
          </Button>
        </ButtonToolbar>
      </div>
    );
  }
}
