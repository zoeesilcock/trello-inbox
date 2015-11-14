import alt from '../alt';
import UsersActions from '../actions/UsersActions';

class UsersStore {
  constructor() {
    this.users = [];

    this.bindListeners({
      handleReceiveData: UsersActions.RECEIVE_DATA,
      handleUpdateCreator: UsersActions.UPDATE_CREATOR,
      handleUpdateAdmin: UsersActions.UPDATE_ADMIN
    });
  }

  handleReceiveData(data) {
    this.users = data;
  }

  handleUpdateCreator(creatorChange) {
    this.users[creatorChange[0]].creator = creatorChange[1];
  }

  handleUpdateAdmin(adminChange) {
    this.users[adminChange[0]].admin = adminChange[1];
  }
}

export default alt.createStore(UsersStore, 'UsersStore');
