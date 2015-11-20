import alt from '../alt';
import IdeaActions from '../actions/IdeaActions';

class IdeaStore {
  constructor() {
    this.id = null;
    this.title = '';
    this.description = '';

    this.bindListeners({
      handleIdUpdate: IdeaActions.UPDATE_ID,
      handleTitleUpdate: IdeaActions.UPDATE_TITLE,
      handleDescriptionUpdate: IdeaActions.UPDATE_DESCRIPTION
    });
  }

  handleIdUpdate(id) {
    this.id = id;
  }

  handleTitleUpdate(title) {
    this.title = title;
  }

  handleDescriptionUpdate(description) {
    this.description = description;
  }
}

export default alt.createStore(IdeaStore, 'IdeaStore');
