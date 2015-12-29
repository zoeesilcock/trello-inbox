import alt from '../alt';

class IdeaActions {
  updateId(id) {
    this.dispatch(id);
  }

  updateTitle(title) {
    this.dispatch(title);
  }

  updateShowModal(showModal) {
    this.dispatch(showModal);
  }
}

export default alt.createActions(IdeaActions);
