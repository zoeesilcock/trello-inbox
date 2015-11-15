import alt from '../alt';

class UsersActions {
  constructor() {
    this.generateActions('updateCreator', 'updateAdmin');
  }
}

export default alt.createActions(UsersActions);
