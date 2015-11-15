import React, { PropTypes } from 'react';
import alt from '../alt';
import UsersListContainer from './UsersListContainer';
import UsersActions from '../actions/UsersActions';
import UsersStore from '../stores/UsersStore';

class UsersContainer extends React.Component {
  static propTypes = {
    initial_users: PropTypes.array.isRequired
  }

  state = UsersStore.getState()

  componentDidMount() {
    UsersStore.listen(this.onChange.bind(this));
    alt.bootstrap(JSON.stringify({
      UsersStore: {
        users: this.props.initial_users
      }
    }));
  }

  componentWillUnmount() {
    UsersStore.unlisten(this.onChange);
  }

  onChange(state) {
    this.setState(state);
  }

  render() {
    return (
      <div>
        <h1>{I18n.t('users.index.users')}</h1>
        <UsersListContainer users={this.state.users} />
      </div>
    );
  }
}

export default UsersContainer;
