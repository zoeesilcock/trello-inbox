@IdeasListContainer = React.createClass
  propTypes:
    ideas: React.PropTypes.array.isRequired

  render: ->
    `<IdeasListComponent ideas={this.props.ideas} />`
