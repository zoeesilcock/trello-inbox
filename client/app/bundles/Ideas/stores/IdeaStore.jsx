import alt from '../alt';
import IdeaActions from '../actions/IdeaActions';

class IdeaStore {
  constructor() {
    this.title = '';
    this.description = '';

    this.bindListeners({
      handleTitleUpdate: IdeaActions.UPDATE_TITLE,
      handleDescriptionUpdate: IdeaActions.UPDATE_DESCRIPTION
    });
  }

  handleTitleUpdate(title) {
    this.title = title;
  }

  handleDescriptionUpdate(description) {
    this.description = description;
  }
}

export default alt.createStore(IdeaStore, 'IdeaStore');
