import React, { PropTypes } from 'react';

export default class UserComponent extends React.Component {
  static propTypes = {
    user: PropTypes.object.isRequired
  }

  render() {
    return (
      <tr>
        <td>
          {this.props.user.name}
        </td>
        <td>
          {this.props.user.creator}
        </td>
        <td>
          {this.props.user.admin}
        </td>
      </tr>
    );
  }
}
