import React, { PropTypes } from 'react';

export default class UserComponent extends React.Component {
  static propTypes = {
    user: PropTypes.object.isRequired
  }

  render() {
    return (
      <li>
        {this.props.user.name}
      </li>
    );
  }
}
