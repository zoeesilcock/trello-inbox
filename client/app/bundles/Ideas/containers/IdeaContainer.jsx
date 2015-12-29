import React, { PropTypes } from 'react';
import IdeaComponent from '../components/IdeaComponent';
import IdeaActions from '../actions/IdeaActions';
import FieldValuesActions from '../actions/FieldValuesActions';

export default class IdeaContainer extends React.Component {
  static propTypes = {
    idea: PropTypes.object.isRequired
  }

  onEdit(event) {
    IdeaActions.updateId(this.props.idea.id);
    IdeaActions.updateTitle(this.props.idea.title);
    FieldValuesActions.setFieldValues(this.props.idea.fields);
    IdeaActions.updateShowModal(true);

    event.stopPropagation();
  }

  onShow(event) {
    window.location = this.props.idea.show_path;
  }

  render() {
    return (
      <IdeaComponent
        idea={this.props.idea}
        onEdit={this.onEdit.bind(this)}
        onShow={this.onShow.bind(this)} />
    );
  }
}
