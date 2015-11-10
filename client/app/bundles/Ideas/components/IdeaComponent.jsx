import React, { PropTypes } from 'react';

export default class IdeaComponent extends React.Component {
  static propTypes = {
    idea: PropTypes.object.isRequired
  }

  editIdeaButton() {
    if (!this.props.idea.owned) {
      return;
    }

    return (
      <a href={this.props.idea.edit_path} className="btn btn-default pull-right">
        <i className="glyphicon glyphicon-pencil"></i>
      </a>
    );
  }

  render() {
    return (
      <li className="col-xs-12 col-sm-4" key={this.props.index}>
        <div className="idea-container">
          <div className="idea-header">
            <img src={this.props.idea.user_avatar} alt={this.props.idea.user_name} className="avatar" />
            <div>
              {this.editIdeaButton()}
              <p className="name">{this.props.idea.user_name}</p>
              <p className="date">{this.props.idea.created_at}</p>
            </div>
          </div>
          <h2>{this.props.idea.title}</h2>
          <p>{this.props.idea.description}</p>
        </div>
      </li>
    );
  }
}
