import alt from '../alt';

class IdeasFilterActions {
  updateFilter(filter) {
    this.dispatch(filter);
  }
}

export default alt.createActions(IdeasFilterActions);
