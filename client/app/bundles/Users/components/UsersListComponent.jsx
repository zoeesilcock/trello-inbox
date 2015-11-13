import React, { PropTypes } from 'react';
import UserContainer from '../containers/UserContainer';

export default class UsersListContainer extends React.Component {
  static propTypes = {
    users: PropTypes.array.isRequired
  }

  render() {
    var users = [];

    this.props.users.map(function(user, index) {
      users.push(<UserContainer key={index} user={user} />);
    });

    return (
      <ul id="users">
        {users}
      </ul>
    );
  }
}
