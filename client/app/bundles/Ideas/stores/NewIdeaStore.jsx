import alt from '../alt';
import NewIdeaActions from '../actions/NewIdeaActions';

class NewIdeaStore {
  constructor() {
    this.title = '';
    this.description = '';

    this.bindListeners({
      handleTitleUpdate: NewIdeaActions.UPDATE_TITLE,
      handleDescriptionUpdate: NewIdeaActions.UPDATE_DESCRIPTION
    });
  }

  handleTitleUpdate(title) {
    this.title = title;
  }

  handleDescriptionUpdate(description) {
    this.description = description;
  }
}

export default alt.createStore(NewIdeaStore, 'NewIdeaStore');
