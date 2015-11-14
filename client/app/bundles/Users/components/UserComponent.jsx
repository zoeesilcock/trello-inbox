import React, { PropTypes } from 'react';
import { Input } from 'react-bootstrap';

export default class UserComponent extends React.Component {
  static propTypes = {
    user: PropTypes.object.isRequired,
    creatorChanged: PropTypes.func.isRequired,
    adminChanged: PropTypes.func.isRequired
  }

  render() {
    return (
      <tr>
        <td>
          {this.props.user.name}
        </td>
        <td>
          <Input type="checkbox" name="creator" checked={this.props.user.creator} onChange={this.props.creatorChanged} />
        </td>
        <td>
          <Input type="checkbox" name="admin" checked={this.props.user.admin} onChange={this.props.adminChanged} />
        </td>
      </tr>
    );
  }
}
