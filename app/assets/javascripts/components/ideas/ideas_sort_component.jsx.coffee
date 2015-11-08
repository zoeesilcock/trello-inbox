Input = ReactBootstrap.Input

@IdeasSortComponent = React.createClass
  render: ->
    `<div>
      <form className="form-inline pull-left sort-form">
        <Input type="select" label={I18n.t('ideas.index.sort.label')} placeholder="select">
          <option value="date">{I18n.t('ideas.index.sort.date')}</option>
          <option value="title">{I18n.t('ideas.index.sort.title')}</option>
          <option value="votes">{I18n.t('ideas.index.sort.votes')}</option>
        </Input>
      </form>
    </div>`
