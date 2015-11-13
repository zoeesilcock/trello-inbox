import React, { PropTypes } from 'react';
import { Input } from 'react-bootstrap';

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
          <Input type="checkbox" name="creator" defaultValue={this.props.user.creator} />
        </td>
        <td>
          <Input type="checkbox" name="admin" defaultValue={this.props.user.admin} />
        </td>
      </tr>
    );
  }
}
