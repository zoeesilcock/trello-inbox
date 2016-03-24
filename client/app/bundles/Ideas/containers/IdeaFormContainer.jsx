import React, { PropTypes } from 'react';
import { Modal } from 'react-bootstrap';
import alt from '../alt';
import connectToStores from 'alt-utils/lib/connectToStores';

import IdeaStore from '../stores/IdeaStore';
import FieldValuesStore from '../stores/FieldValuesStore';
import FieldValuesActions from '../actions/FieldValuesActions';
import IdeaActions from '../actions/IdeaActions';
import IdeaFormFieldsContainer from '../containers/IdeaFormFieldsContainer';
import IdeaFormButtonsContainer from '../containers/IdeaFormButtonsContainer';

export class IdeaFormContainer extends React.Component {
  static propTypes = {
    id: PropTypes.number,
    title: PropTypes.string.isRequired,
    fields: PropTypes.array.isRequired,
    csrfToken: PropTypes.string.isRequired,
    actionPath: PropTypes.string.isRequired,
    showModal: PropTypes.bool.isRequired,
    initial_fields: PropTypes.string.isRequired,
  };

  static getStores() {
    return [IdeaStore, FieldValuesStore];
  }

  static getPropsFromStores() {
    return {
      ...IdeaStore.getState(),
      ...FieldValuesStore.getState(),
    };
  }

  constructor() {
    super();

    this.onHide = this.onHide.bind(this);
  }

  componentDidMount() {
    const data = JSON.parse(this.props.initial_fields);
    const initialData = {
      FieldValuesStore: {
        fields: data.initial_fields,
      },
    };

    alt.bootstrap(JSON.stringify(initialData));
    FieldValuesActions.emptyFieldValues();
  }

  onHide(event) {
    FieldValuesActions.emptyFieldValues();
    IdeaActions.updateShowModal(false);
  }

  headerText() {
    if (this.props.id !== null) {
      return I18n.t('ideas.form.title_edit');
    }

    return I18n.t('ideas.form.title_new');
  }

  formAction() {
    if (this.props.id !== null) {
      return `${this.props.actionPath}/${this.props.id}`;
    }

    return this.props.actionPath;
  }

  patch() {
    if (this.props.id !== null) {
      return (
        <input type="hidden" name="_method" value="patch" />
      );
    }

    return null;
  }

  render() {
    return (
      <div>
        <Modal show={this.props.showModal} onHide={this.onHide} backdrop={true}>
          <form action={this.formAction()} method="POST">
            <input
              type="hidden"
              name="authenticity_token"
              value={this.props.csrfToken}
            />
            {this.patch()}

            <Modal.Header>
              <h4 className="modal-title">{this.headerText()}</h4>
            </Modal.Header>
            <Modal.Body>
              <IdeaFormFieldsContainer
                title={this.props.title}
                fields={this.props.fields}
              />
            </Modal.Body>
            <Modal.Footer>
              <IdeaFormButtonsContainer
                id={this.props.id}
                title={this.props.title}
                fields={this.props.fields}
                onHide={this.onHide}
              />
            </Modal.Footer>
          </form>
        </Modal>
      </div>
    );
  }
}

export default connectToStores(IdeaFormContainer);
