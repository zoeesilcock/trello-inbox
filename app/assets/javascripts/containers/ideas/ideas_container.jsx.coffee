@IdeasContainer = React.createClass
  propTypes:
    ideas: React.PropTypes.array.isRequired

  render: ->
    `<div>
      <IdeasHeaderContainer />
      <hr />
      <IdeasListContainer ideas={this.props.ideas} />
    </div>`
