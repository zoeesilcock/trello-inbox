import React, { PropTypes } from 'react';
import { Input } from 'react-bootstrap';

export default class IdeaFormFieldComponent extends React.Component {
  static propTypes = {
    id: PropTypes.number.isRequired,
    title: PropTypes.string.isRequired,
    description: PropTypes.string,
    value: PropTypes.string,
    onChange: PropTypes.func.isRequired
  }

  render() {
    let fieldName = 'fields[ids][' + this.props.id + ']';

    return(
      <Input type="textarea"
        name={fieldName}
        label={this.props.title}
        help={this.props.description}
        rows="6"
        onChange={this.props.onChange}
        value={this.props.value} />
    );
  }
}
