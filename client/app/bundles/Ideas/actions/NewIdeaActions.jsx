import alt from '../alt';

class NewIdeaActions {
  updateTitle(title) {
    this.dispatch(title);
  }

  updateDescription(description) {
    this.dispatch(description);
  }
}

export default alt.createActions(NewIdeaActions);
