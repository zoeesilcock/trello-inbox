import React, { PropTypes } from 'react';
import { Input } from 'react-bootstrap';

import IdeaFormFieldContainer from '../containers/IdeaFormFieldContainer';

export class IdeaFormFieldsComponent extends React.Component {
  static propTypes = {
    title: PropTypes.string,
    fields: PropTypes.array.isRequired,
    onTitleChange: PropTypes.func.isRequired,
  };

  render() {
    const fields = [];
    const title = (
        <span>{I18n.t('ideas.form.idea_title')} <small>
        ({I18n.t('ideas.form.required')})</small></span>
        );

    this.props.fields.forEach((field, index) => {
      fields.push(
        <IdeaFormFieldContainer key={index} index={index} field={field} />
      );
    });

    return (
      <div>
        <Input type="text"
          name="idea[title]"
          label={title}
          onChange={this.props.onTitleChange}
          value={this.props.title}
        />
        {fields}
      </div>
    );
  }
}

export default IdeaFormFieldsComponent;
