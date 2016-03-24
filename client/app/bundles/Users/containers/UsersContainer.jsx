import React, { PropTypes } from 'react';
import alt from '../alt';

import UsersListContainer from './UsersListContainer';
import UsersStore from '../stores/UsersStore';

export class UsersContainer extends React.Component {
  static propTypes = {
    initial_users: PropTypes.array.isRequired,
  };

  constructor() {
    super();

    this.onChange = this.onChange.bind(this);
  }

  state = UsersStore.getState();

  componentDidMount() {
    const initialData = {
      UsersStore: {
        users: this.props.initial_users,
      },
    };

    UsersStore.listen(this.onChange.bind(this));
    alt.bootstrap(JSON.stringify(initialData));
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
