import React, { PropTypes } from 'react';
import { Input } from 'react-bootstrap';

export default class IdeaFormFieldsComponent extends React.Component {
  static propTypes = {
    onTitleChange: PropTypes.func.isRequired,
    onDescriptionChange: PropTypes.func.isRequired,
    title: PropTypes.string,
    description: PropTypes.string
  }

  render() {
    return (
      <div>
        <Input type="text"
          name="idea[title]"
          label={ I18n.t('ideas.form.idea_title') }
          onChange={this.props.onTitleChange}
          value={this.props.title} />

        <Input type="textarea"
          name="idea[description]"
          label={ I18n.t('ideas.form.idea_description') }
          onChange={this.props.onDescriptionChange}
          value={this.props.description} />
      </div>
    );
  }
}
