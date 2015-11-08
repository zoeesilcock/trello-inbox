Input = ReactBootstrap.Input

@IdeasFilterComponent = React.createClass
  render: ->
    `<div>
      <form className="form-inline pull-left filter-form">
        <Input type="select" label="Show" placeholder="select">
          <option value="all">All ideas</option>
          <option value="mine">My ideas</option>
        </Input>
      </form>
    </div>`
