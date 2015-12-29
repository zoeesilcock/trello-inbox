import React, { PropTypes } from 'react';
import { Modal } from 'react-bootstrap';
import alt from '../alt';
import connectToStores from 'alt/utils/connectToStores';

import IdeaStore from '../stores/IdeaStore';
import FieldValuesStore from '../stores/FieldValuesStore';
import IdeaActions from '../actions/IdeaActions';
import IdeaFormFieldsContainer from '../containers/IdeaFormFieldsContainer';
import IdeaFormButtonsContainer from '../containers/IdeaFormButtonsContainer';

class IdeaFormContainer extends React.Component {
  static propTypes = {
    actionPath: PropTypes.string.isRequired,
  }

  static getStores() {
    return [IdeaStore, FieldValuesStore];
  }

  static getPropsFromStores() {
    return {
      ...IdeaStore.getState(),
      ...FieldValuesStore.getState()
    };
  }

  componentDidMount() {
    let data = JSON.parse(this.props.initial_fields);
    alt.bootstrap(JSON.stringify({
      FieldValuesStore: {
        fields: Object.values(data.initial_fields)
      }
    }));
  }

  onHide(event) {
    IdeaActions.updateShowModal(false);
  }

  headerText() {
    if (this.props.id != null) {
      return I18n.t('ideas.form.title_edit');
    } else {
      return I18n.t('ideas.form.title_new');
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
                <IdeaFormFieldsContainer
                  title={this.props.title}
                  fields={this.props.fields} />
              </Modal.Body>
              <Modal.Footer>
                <IdeaFormButtonsContainer
                  id={this.props.id}
                  title={this.props.title}
                  onHide={this.onHide} />
              </Modal.Footer>
            </form>
          </Modal>
      </div>
    );
  }
}

export default connectToStores(IdeaFormContainer);
