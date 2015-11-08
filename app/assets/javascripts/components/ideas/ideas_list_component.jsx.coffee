@IdeasListComponent = React.createClass
  propTypes:
    ideas: React.PropTypes.array.isRequired

  render: ->
    ideas = []
    @props.ideas.map (idea, index) =>
      ideas.push `<IdeaComponent key={index} idea={idea} />`

    `<ul id="ideas" className="row">
      {ideas}
    </ul>`
