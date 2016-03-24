import React, { PropTypes } from 'react';

import UserComponent from '../components/UserComponent';
import UsersActions from '../actions/UsersActions';

export class UserContainer extends React.Component {
  static propTypes = {
    user: PropTypes.object.isRequired,
    index: PropTypes.number.isRequired,
  };

  constructor() {
    super();

    this.onCreatorChanged = this.onCreatorChanged.bind(this);
    this.onAdminChanged = this.onAdminChanged.bind(this);
  }

  onCreatorChanged(event) {
    UsersActions.updateCreator(this.props.index, event.target.checked);
  }

  onAdminChanged(event) {
    UsersActions.updateAdmin(this.props.index, event.target.checked);
  }

  render() {
    return (
      <UserComponent
        user={this.props.user}
        creatorChanged={this.onCreatorChanged}
        adminChanged={this.onAdminChanged}
      />
    );
  }
}

export default UserContainer;
