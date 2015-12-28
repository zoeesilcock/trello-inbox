import React, { PropTypes } from 'react';
import { Input } from 'react-bootstrap';

export default class FieldFormFieldsComponent extends React.Component {
  static propTypes = {
    onTitleChange: PropTypes.func.isRequired,
    onDescriptionChange: PropTypes.func.isRequired,
    onRequiredChange: PropTypes.func.isRequired,
    title: PropTypes.string,
    description: PropTypes.string,
    required: PropTypes.bool
  }

  render() {
    return (
      <div>
        <Input type="text"
          name="field[title]"
          label={ I18n.t('fields.form.field_title') }
          onChange={this.props.onTitleChange}
          value={this.props.title} />

        <Input type="checkbox"
          label={ I18n.t('fields.form.field_required') }
          onChange={this.props.onRequiredChange}
          checked={this.props.required} />

        <Input type="hidden"
          name="field[required]"
          value={this.props.required} />

        <Input type="textarea"
          name="field[description]"
          label={ I18n.t('fields.form.field_description') }
          rows="8"
          onChange={this.props.onDescriptionChange}
          value={this.props.description} />
      </div>
    );
  }
}
