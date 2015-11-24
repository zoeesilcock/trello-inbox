import alt from '../alt';

class IdeasSearchActions {
  updateSearch(search) {
    this.dispatch(search);
  }
}

export default alt.createActions(IdeasSearchActions);
