import React, { PropTypes } from 'react';

export default class NewIdeaButtonsComponent extends React.Component {
  static propTypes = {
  }

  render() {
    return (
      <div>
        <button type="button" className="btn btn-default" data-dismiss="modal">{ I18n.t('ideas.form.cancel') }</button>
        <button type="submit" className="btn btn-success">{ I18n.t('ideas.form.create') }</button>
      </div>
    );
  }
}
