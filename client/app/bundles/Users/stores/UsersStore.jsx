import alt from '../alt';
import UsersActions from '../actions/UsersActions';

class UsersStore {
  constructor() {
    this.users = [];

    this.bindListeners({
      handleUpdateCreator: UsersActions.UPDATE_CREATOR,
      handleUpdateAdmin: UsersActions.UPDATE_ADMIN
    });
  }

  handleUpdateCreator(creatorChange) {
    this.users[creatorChange[0]].creator = creatorChange[1];
    this.saveUser(this.users[creatorChange[0]].id, { creator: creatorChange[1] });
  }

  handleUpdateAdmin(adminChange) {
    this.users[adminChange[0]].admin = adminChange[1];
    this.saveUser(this.users[adminChange[0]].id, { admin: adminChange[1] });
  }

  saveUser(id, change) {
    $.ajax('/users/' + id, {
      method: 'PUT',
      data: {
        user: change
      }
    });
  }
}

export default alt.createStore(UsersStore, 'UsersStore');
