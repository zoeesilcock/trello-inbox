import alt from '../alt';

class IdeasStore {
  constructor() {
    this.ideas = [];
  }
}

export default alt.createStore(IdeasStore, 'IdeasStore');
