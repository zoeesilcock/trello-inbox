import React, { PropTypes } from 'react';
import connectToStores from 'alt/utils/connectToStores';
import IdeaStore from '../stores/IdeaStore';
import IdeaActions from '../actions/IdeaActions';
import IdeaFormFieldsContainer from '../containers/IdeaFormFieldsContainer';
import IdeaFormButtonsContainer from '../containers/IdeaFormButtonsContainer';

class IdeaFormContainer extends React.Component {
  static propTypes = {
    actionPath: PropTypes.string.isRequired,
  }

  static getStores() {
    return [IdeaStore];
  }

  static getPropsFromStores() {
    return IdeaStore.getState();
  }

  onClose(event) {
    IdeaActions.updateId(null);
    IdeaActions.updateTitle('');
    IdeaActions.updateDescription('');
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
      <div id="idea-form-modal" className="modal fade" onClick={this.onClose}>
        <form action={this.formAction()} method="POST">
          <input type="hidden" name="authenticity_token" value={this.props.csrfToken} />
          {this.patch()}
          <div className="modal-dialog">
            <div className="modal-content">
              <div className="modal-header">
                <button type="button" onClick={this.onClose} className="close" data-dismiss="modal" aria-label={I18n.t('ideas.form.close')}><span aria-hidden="true">&times;</span></button>
                <h4 className="modal-title">{this.headerText()}</h4>
              </div>
              <div className="modal-body">
                <IdeaFormFieldsContainer title={this.props.title} description={this.props.description} />
              </div>
              <div className="modal-footer">
                <IdeaFormButtonsContainer
                  id={this.props.id}
                  title={this.props.title}
                  description={this.props.description}
                  onClose={this.onClose} />
              </div>
            </div>
          </div>
        </form>
      </div>
    );
  }
}

export default connectToStores(IdeaFormContainer);
