import alt from '../alt';

class UsersActions {
  constructor() {
    this.generateActions('receiveData', 'updateCreator', 'updateAdmin');
  }
}

export default alt.createActions(UsersActions);
