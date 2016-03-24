import alt from '../alt';
import IdeasFilterActions from '../actions/IdeasFilterActions';

class IdeasFilterStore {
  constructor() {
    this.filter = 'all';

    this.bindListeners({
      handleUpdateFilter: IdeasFilterActions.UPDATE_FILTER,
    });
  }

  handleUpdateFilter(filter) {
    this.filter = filter;
  }
}

export default alt.createStore(IdeasFilterStore, 'IdeasFilterStore');
