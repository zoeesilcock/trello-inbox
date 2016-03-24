import React, { PropTypes } from 'react';

export class IdeaComponent extends React.Component {
  static propTypes = {
    idea: PropTypes.object.isRequired,
    onEdit: PropTypes.func.isRequired,
    onShow: PropTypes.func.isRequired,
  };

  editIdeaButton() {
    if (!this.props.idea.owned) {
      return null;
    }

    return (
      <a href="#"
        onClick={this.props.onEdit}
        className="btn btn-default pull-right"
      >
        <i className="glyphicon glyphicon-pencil"></i>
      </a>
    );
  }

  render() {
    const fields = [];

    this.props.idea.fields.forEach((field, index) => {
      fields.push(
        <div key={index}>
          <b>{field.title}</b>
          <p>{field.value}</p>
        </div>
      );
    });

    return (
      <li className="flex-child fill-height">
        <div className="idea-container" onClick={this.props.onShow}>
          <div className="idea-header">
            <img
              src={this.props.idea.user_avatar}
              alt={this.props.idea.user_name}
              className="avatar"
            />
            <div>
              {this.editIdeaButton()}
              <p className="name">{this.props.idea.user_name}</p>
              <p className="date">
                {I18n.l('time.formats.short', this.props.idea.created_at * 1000)}
              </p>
            </div>
          </div>
          <h2>{this.props.idea.title}</h2>
          {fields}
        </div>
      </li>
    );
  }
}

export default IdeaComponent;
