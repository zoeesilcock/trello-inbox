import React, { PropTypes } from 'react';
import { Input } from 'react-bootstrap';
import IdeaFormFieldContainer from '../containers/IdeaFormFieldContainer';

export default class IdeaFormFieldsComponent extends React.Component {
  static propTypes = {
    title: PropTypes.string,
    fields: PropTypes.array.isRequired,
    onTitleChange: PropTypes.func.isRequired
  }

  render() {
    let fields = [];
    this.props.fields.map((field, index) => {
      fields.push(
        <IdeaFormFieldContainer key={index} index={index} field={field} />
      );
    });

    return (
      <div>
        <Input type="text"
          name="idea[title]"
          label={ I18n.t('ideas.form.idea_title') }
          onChange={this.props.onTitleChange}
          value={this.props.title} />

          {fields}
      </div>
    );
  }
}
