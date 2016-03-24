import React, { PropTypes } from 'react';

import UsersListComponent from '../components/UsersListComponent';

export class UsersListContainer extends React.Component {
  static propTypes = {
    users: PropTypes.array.isRequired,
  };

  render() {
    return (
      <UsersListComponent users={this.props.users} />
    );
  }
}

export default UsersListContainer;
