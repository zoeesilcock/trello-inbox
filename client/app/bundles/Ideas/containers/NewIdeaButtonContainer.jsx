import React from 'react';
import NewIdeaButtonComponent from '../components/NewIdeaButtonComponent';
import IdeaActions from '../actions/IdeaActions';

export default class NewIdeaButtonContainer extends React.Component {
  openModal() {
    IdeaActions.updateId(null);
    IdeaActions.updateTitle('');
    IdeaActions.updateDescription('');
    IdeaActions.updateShowModal(true);
  }

  render() {
    return (
      <NewIdeaButtonComponent openModal={this.openModal} />
    );
  }
}
