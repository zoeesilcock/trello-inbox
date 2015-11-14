import React, { PropTypes } from 'react';
import { Input } from 'react-bootstrap';
import I18n from 'i18n-js';

export default class IdeasFilterComponent extends React.Component {
  static propTypes = {
    filter: PropTypes.string.isRequired,
    onChange: PropTypes.func.isRequired
  }

  render() {
    return (
      <div className="col-xs-6 col-sm-3 header-left">
        <form className="form-inline filter-form">
          <Input type="select" label={I18n.t('ideas.index.filter.label')} placeholder="select" defaultValue={this.props.filter} onChange={this.props.onChange}>
            <option value="all">{I18n.t('ideas.index.filter.all')}</option>
            <option value="mine">{I18n.t('ideas.index.filter.mine')}</option>
          </Input>
        </form>
      </div>
    );
  }
}
