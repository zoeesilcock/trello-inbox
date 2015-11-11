import alt from '../alt';
import IdeasSortActions from '../actions/IdeasSortActions';

class IdeasSortStore {
  constructor() {
    this.sort = 'date';

    this.bindListeners({
      handleUpdateSort: IdeasSortActions.UPDATE_SORT
    });
  }

  handleUpdateSort(sort) {
    this.sort = sort;
  }
}

export default alt.createStore(IdeasSortStore, 'IdeasSortStore');
