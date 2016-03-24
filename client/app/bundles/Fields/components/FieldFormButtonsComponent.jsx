import React, { PropTypes } from 'react';
import { ButtonToolbar, Button } from 'react-bootstrap';

export class IdeaFormButtonsComponent extends React.Component {
  static propTypes = {
    fieldIsInvalid: PropTypes.bool.isRequired,
    fieldIsNew: PropTypes.bool.isRequired,
    onHide: PropTypes.func.isRequired,
  };

  render() {
    const createButton = this.props.fieldIsNew ?
      I18n.t('fields.form.create') : I18n.t('fields.form.update');

    return (
      <div>
        <ButtonToolbar>
          <Button
            type="submit"
            className="pull-right"
            disabled={this.props.fieldIsInvalid}
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
            {I18n.t('fields.form.cancel')}
          </Button>
        </ButtonToolbar>
      </div>
    );
  }
}

export default IdeaFormButtonsComponent;
