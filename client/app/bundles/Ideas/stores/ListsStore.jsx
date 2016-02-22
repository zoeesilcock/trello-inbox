import alt from '../alt';

class ListsStore {
  constructor() {
    this.lists = [];
  }
}

export default alt.createStore(ListsStore, 'ListsStore');
