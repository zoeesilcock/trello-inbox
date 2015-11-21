import alt from '../alt';
import IdeaActions from '../actions/IdeaActions';

class IdeaStore {
  constructor() {
    this.id = null;
    this.title = '';
    this.description = '';
    this.showModal = false;

    this.bindListeners({
      handleIdUpdate: IdeaActions.UPDATE_ID,
      handleTitleUpdate: IdeaActions.UPDATE_TITLE,
      handleDescriptionUpdate: IdeaActions.UPDATE_DESCRIPTION,
      handleModalUpdate: IdeaActions.UPDATE_SHOW_MODAL
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

  handleModalUpdate(showModal) {
    this.showModal = showModal;
  }
}

export default alt.createStore(IdeaStore, 'IdeaStore');
