import React, { PropTypes } from 'react';
import { Modal } from 'react-bootstrap';
import connectToStores from 'alt/utils/connectToStores';

import FieldStore from '../stores/FieldStore';
import FieldActions from '../actions/FieldActions';

import FieldFormFieldsContainer from './FieldFormFieldsContainer';
import FieldFormButtonsContainer from './FieldFormButtonsContainer';

class FieldFormContainer extends React.Component {
  static propTypes = {
    actionPath: PropTypes.string.isRequired,
  }

  static getStores() {
    return [FieldStore];
  }

  static getPropsFromStores() {
    return FieldStore.getState();
  }

  onHide(event) {
    FieldActions.updateShowModal(false);
  }

  headerText() {
    if (this.props.id != null) {
      return I18n.t('fields.form.title_edit');
    } else {
      return I18n.t('fields.form.title_new');
    }
  }

  formAction() {
    if (this.props.id != null) {
      return this.props.actionPath + '/' + this.props.id;
    } else {
      return this.props.actionPath;
    }
  }

  patch() {
    if (this.props.id != null) {
      return (
        <input type="hidden" name="_method" value="patch" />
      );
    }
  }

  render() {
    return (
      <div>
          <Modal show={this.props.showModal} onHide={this.onHide} backdrop>
            <form action={this.formAction()} method="POST">
              <input type="hidden" name="authenticity_token" value={this.props.csrfToken} />
              {this.patch()}

              <Modal.Header>
                <h4 className="modal-title">{this.headerText()}</h4>
              </Modal.Header>
              <Modal.Body>
                <FieldFormFieldsContainer
                  title={this.props.title}
                  description={this.props.description}
                  required={this.props.required}
                />
              </Modal.Body>
              <Modal.Footer>
                <FieldFormButtonsContainer
                  id={this.props.id}
                  title={this.props.title}
                  onHide={this.onHide}
                />
              </Modal.Footer>
            </form>
          </Modal>
      </div>
    );
  }
}

export default connectToStores(FieldFormContainer);
