import React, { PropTypes } from 'react';

import IdeaComponent from '../components/IdeaComponent';
import IdeaActions from '../actions/IdeaActions';
import FieldValuesActions from '../actions/FieldValuesActions';

export class IdeaContainer extends React.Component {
  static propTypes = {
    idea: PropTypes.object.isRequired,
  };

  constructor() {
    super();

    this.onEdit = this.onEdit.bind(this);
    this.onShow = this.onShow.bind(this);
  }

  onEdit(event) {
    IdeaActions.updateId(this.props.idea.id);
    IdeaActions.updateTitle(this.props.idea.title);
    FieldValuesActions.setFieldValues(this.props.idea.fields);
    IdeaActions.updateShowModal(true);

    event.stopPropagation();
  }

  onShow() {
    window.location = this.props.idea.show_path;
  }

  render() {
    return (
      <IdeaComponent
        idea={this.props.idea}
        onEdit={this.onEdit}
        onShow={this.onShow}
      />
    );
  }
}

export default IdeaContainer;
