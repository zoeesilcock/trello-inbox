@IdeasHeaderComponent = React.createClass
  render: ->
    `<div className="row">
      <div className="col-xs-12">
        <IdeasFilterContainer />
        <IdeasSortContainer />
        <IdeasSearchContainer />
      </div>
    </div>`
