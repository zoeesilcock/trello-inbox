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
    console.log(cratorChange);
  }

  handleUpdateAdmin(creatorAdmin) {
    console.log(cratorAdmin);
  }
}

export default alt.createStore(UsersStore, 'UsersStore');
