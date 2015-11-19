import React, { PropTypes } from 'react';
import { Input } from 'react-bootstrap';

export default class IdeaFormFieldsComponent extends React.Component {
  static propTypes = {
    title: PropTypes.string,
    description: PropTypes.string
  }

  render() {
    return (
      <div>
        <Input type="text"
          name="idea[title]"
          label={ I18n.t('ideas.form.idea_title') }
          defaultValue={this.props.title} />

        <Input type="textarea"
          name="idea[description]"
          label={ I18n.t('ideas.form.idea_description') }
          defaultValue={this.props.description} />
      </div>
    );
  }
}
