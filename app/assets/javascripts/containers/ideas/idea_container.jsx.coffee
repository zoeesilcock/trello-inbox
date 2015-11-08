@IdeaContainer = React.createClass
  propTypes:
    idea: React.PropTypes.object.isRequired

  render: ->
    `<IdeaComponent idea={this.props.idea} />`
