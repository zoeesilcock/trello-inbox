import React, { PropTypes } from 'react';
import { Input } from 'react-bootstrap';

export default class FieldComponent extends React.Component {
  static propTypes = {
    field: PropTypes.object.isRequired,
    editField: PropTypes.func.isRequired
  }

  render() {
    return (
      <tr>
        <td>
          <i className="glyphicon glyphicon-menu-hamburger"></i>
        </td>
        <td>
          <a href="#" onClick={this.props.editField}>
            <i className="glyphicon glyphicon-pencil"></i>
          </a>
        </td>
        <td>
          {this.props.field.title}
        </td>
        <td>
          {this.props.field.description}
        </td>
        <td>
          {this.props.field.required ? 'yes' : 'no'}
        </td>
      </tr>
    );
  }
}
