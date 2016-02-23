import React, { PropTypes } from 'react';
import { Input } from 'react-bootstrap';

export default class IdeaFormFieldComponent extends React.Component {
  static propTypes = {
    id: PropTypes.number.isRequired,
    title: PropTypes.string.isRequired,
    description: PropTypes.string,
    value: PropTypes.string,
    required: PropTypes.bool,
    onChange: PropTypes.func.isRequired
  };

  render() {
    let fieldName = 'fields[ids][' + this.props.id + ']';
    let title = this.props.title;

    if (this.props.required) {
      title = (<span>{this.props.title} <small>({I18n.t('ideas.form.required')})</small></span>);
    }

    return(
      <Input type="textarea"
        name={fieldName}
        label={title}
        help={this.props.description}
        rows="6"
        onChange={this.props.onChange}
        value={this.props.value} />
    );
  }
}
