@IdeaComponent = React.createClass
  propTypes:
    idea: React.PropTypes.object.isRequired

  edit_idea_button: ->
    return unless @props.idea.owned

    `<a href={this.props.idea.edit_path} className="btn btn-default pull-right">
      <i className="glyphicon glyphicon-pencil"></i>
    </a>`

  render: ->
    `<li className="col-xs-12 col-sm-4" key={this.props.index}>
      <div className="idea-container">
        <div className="idea-header">
          <img src={this.props.idea.user_avatar} alt={this.props.idea.user_name} className="avatar" />
          <div>
            {this.edit_idea_button()}
            <p className="name">{this.props.idea.user_name}</p>
            <p className="date">{this.props.idea.created_at}</p>
          </div>
        </div>
        <h2>{this.props.idea.title}</h2>
        <p>{this.props.idea.description}</p>
      </div>
    </li>`
