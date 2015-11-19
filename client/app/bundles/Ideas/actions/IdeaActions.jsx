import alt from '../alt';

class IdeaActions {
  updateTitle(title) {
    this.dispatch(title);
  }

  updateDescription(description) {
    this.dispatch(description);
  }
}

export default alt.createActions(IdeaActions);
