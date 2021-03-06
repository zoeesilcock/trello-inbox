import React from 'react';

import NewIdeaButtonComponent from '../components/NewIdeaButtonComponent';
import IdeaActions from '../actions/IdeaActions';

export class NewIdeaButtonContainer extends React.Component {
  openModal() {
    IdeaActions.updateId(null);
    IdeaActions.updateTitle('');
    IdeaActions.updateShowModal(true);
  }

  render() {
    return (
      <NewIdeaButtonComponent openModal={this.openModal} />
    );
  }
}

export default NewIdeaButtonContainer;
