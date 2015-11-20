import alt from '../alt';

class IdeaActions {
  updateId(id) {
    this.dispatch(id);
  }

  updateTitle(title) {
    this.dispatch(title);
  }

  updateDescription(description) {
    this.dispatch(description);
  }
}

export default alt.createActions(IdeaActions);
