import React, { PropTypes } from 'react';
import connectToStores from 'alt/utils/connectToStores';
import UsersListContainer from './UsersListContainer';
import UsersActions from '../actions/UsersActions';
import UsersStore from '../stores/UsersStore';

class UsersContainer extends React.Component {
  static propTypes = {
    users: PropTypes.array.isRequired
  }

  static getStores() {
    return [UsersStore];
  }

  static getPropsFromStores() {
    return UsersStore.getState();
  }

  constructor(props, context, updater) {
    super(props, context, updater);
    UsersActions.receiveData(this.props.initial_users);
  }

  render() {
    return (
      <div>
        <h1>{I18n.t('users.index.users')}</h1>
        <UsersListContainer users={this.props.users} />
      </div>
    );
  }
}

export default connectToStores(UsersContainer);
