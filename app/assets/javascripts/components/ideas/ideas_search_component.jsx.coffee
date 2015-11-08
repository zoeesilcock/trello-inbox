Input = ReactBootstrap.Input

@IdeasSearchComponent = React.createClass
  render: ->
    `<div>
      <form className="form-inline pull-right search-form">
        <Input type="text" name="search" placeholder={I18n.t('ideas.index.search.label')} />
      </form>
    </div>`
