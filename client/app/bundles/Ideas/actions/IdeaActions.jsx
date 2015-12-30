import alt from '../alt';

class IdeaActions {
  updateId(id) {
    return id;
  }

  updateTitle(title) {
    return title;
  }

  updateShowModal(showModal) {
    return showModal;
  }
}

export default alt.createActions(IdeaActions);
