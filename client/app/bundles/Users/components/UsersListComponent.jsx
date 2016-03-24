import React, { PropTypes } from 'react';
import { Table } from 'react-bootstrap';

import UserContainer from '../containers/UserContainer';

export class UsersListComponent extends React.Component {
  static propTypes = {
    users: PropTypes.array.isRequired,
  };

  render() {
    const users = [];

    this.props.users.forEach((user, index) => {
      users.push(<UserContainer key={index} index={index} user={user} />);
    });

    return (
      <Table id="users" striped={true}>
        <thead>
          <tr>
            <th>{I18n.t('users.index.name')}</th>
            <th>{I18n.t('users.index.creator')}</th>
            <th>{I18n.t('users.index.admin')}</th>
          </tr>
        </thead>
        <tbody>
          {users}
        </tbody>
      </Table>
    );
  }
}

export default UsersListComponent;
