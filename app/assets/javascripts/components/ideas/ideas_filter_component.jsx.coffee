Input = ReactBootstrap.Input

@IdeasFilterComponent = React.createClass
  render: ->
    `<div>
      <form className="form-inline pull-left filter-form">
        <Input type="select" label={I18n.t('ideas.index.filter.label')} placeholder="select">
          <option value="all">{I18n.t('ideas.index.filter.all')}</option>
          <option value="mine">{I18n.t('ideas.index.filter.mine')}</option>
        </Input>
      </form>
    </div>`
