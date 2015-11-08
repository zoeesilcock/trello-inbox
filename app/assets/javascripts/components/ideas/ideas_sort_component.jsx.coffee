Input = ReactBootstrap.Input

@IdeasSortComponent = React.createClass
  render: ->
    `<div>
      <form className="form-inline pull-left sort-form">
        <Input type="select" label="Sort by" placeholder="select">
          <option value="date">Date</option>
          <option value="title">Title</option>
          <option value="votes">Votes</option>
        </Input>
      </form>
    </div>`
