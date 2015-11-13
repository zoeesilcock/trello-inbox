import React, { PropTypes } from 'react';
import UsersListContainer from './UsersListContainer'

export default class IdeasContainer extends React.Component {
  static propTypes = {
    users: PropTypes.array.isRequired
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
