import React, { PropTypes } from 'react';
import UserComponent from '../components/UserComponent';

export default class UserContainer extends React.Component {
  static propTypes = {
    user: PropTypes.object.isRequired
  }

  render() {
    return (
      <UserComponent user={this.props.user} />
    );
  }
}
