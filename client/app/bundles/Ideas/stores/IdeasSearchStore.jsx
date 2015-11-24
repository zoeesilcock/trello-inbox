import alt from '../alt';
import IdeasSearchActions from '../actions/IdeasSearchActions';

class IdeasSearchStore {
  constructor() {
    this.search = '';

    this.bindListeners({
      handleUpdateSearch: IdeasSearchActions.UPDATE_SEARCH
    });
  }

  handleUpdateSearch(search) {
    this.search = search;
  }
}

export default alt.createStore(IdeasSearchStore, 'IdeasSearchStore');
