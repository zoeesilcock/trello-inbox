import React, { PropTypes } from 'react';
import { ButtonToolbar, Button } from 'react-bootstrap';

export class IdeaFormButtonsComponent extends React.Component {
  static propTypes = {
    ideaIsInvalid: PropTypes.bool.isRequired,
    ideaIsNew: PropTypes.bool.isRequired,
    onHide: PropTypes.func.isRequired,
  };

  render() {
    const createButton = this.props.ideaIsNew ?
      I18n.t('ideas.form.create') : I18n.t('ideas.form.update');

    return (
      <div>
        <ButtonToolbar>
          <Button
            type="submit"
            className="pull-right"
            disabled={this.props.ideaIsInvalid}
            bsStyle="success"
          >
            {createButton}
          </Button>

          <Button
            className="pull-right"
            bsStyle="default"
            data-dismiss="modal"
            onClick={this.props.onHide}
          >
            {I18n.t('ideas.form.cancel')}
          </Button>
        </ButtonToolbar>
      </div>
    );
  }
}

export default IdeaFormButtonsComponent;
