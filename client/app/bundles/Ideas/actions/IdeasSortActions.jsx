import alt from '../alt';

class IdeasSortActions {
  updateSort(sort) {
    this.dispatch(sort);
  }
}

export default alt.createActions(IdeasSortActions);
