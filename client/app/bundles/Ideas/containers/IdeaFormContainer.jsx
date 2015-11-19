import React, { PropTypes } from 'react';
import connectToStores from 'alt/utils/connectToStores';
import NewIdeaStore from '../stores/NewIdeaStore';
import IdeaFormFieldsContainer from '../containers/IdeaFormFieldsContainer';
import IdeaFormButtonsContainer from '../containers/IdeaFormButtonsContainer';

class IdeaFormContainer extends React.Component {
  static propTypes = {
    actionPath: PropTypes.string.isRequired
  }

  static getStores() {
    return [NewIdeaStore];
  }

  static getPropsFromStores() {
    return NewIdeaStore.getState();
  }

  render() {
    return (
      <div id="idea-form-modal" className="modal fade">
        <form action={this.props.actionPath} method="post">
          <input type="hidden" name="authenticity_token" value={ this.props.csrfToken } />
          <div className="modal-dialog">
            <div className="modal-content">
              <div className="modal-header">
                <button type="button" className="close" data-dismiss="modal" aria-label={ I18n.t('ideas.form.close') }><span aria-hidden="true">&times;</span></button>
                <h4 className="modal-title">{ I18n.t('ideas.form.title_new') }</h4>
              </div>
              <div className="modal-body">
                <IdeaFormFieldsContainer title={this.props.title} description={this.props.description} />
              </div>
              <div className="modal-footer">
                <IdeaFormButtonsContainer />
              </div>
            </div>
          </div>
        </form>
      </div>
    );
  }
}

export default connectToStores(IdeaFormContainer);
