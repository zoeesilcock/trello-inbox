import alt from '../alt';
import request from 'superagent';
require('superagent-rails-csrf')(request);

import UsersActions from '../actions/UsersActions';

class UsersStore {
  constructor() {
    this.users = [];

    this.bindListeners({
      handleUpdateCreator: UsersActions.UPDATE_CREATOR,
      handleUpdateAdmin: UsersActions.UPDATE_ADMIN,
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
    request
      .put(`/users/${id}`)
      .send({ user: change })
      .setCsrfToken()
      .end((err, res) => {
        // no-op
      });
  }
}

export default alt.createStore(UsersStore, 'UsersStore');
