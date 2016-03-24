import React, { PropTypes } from 'react';
import { Input } from 'react-bootstrap';

export class IdeasSortComponent extends React.Component {
  static propTypes = {
    sort: PropTypes.string.isRequired,
    onChange: PropTypes.func.isRequired,
  };

  render() {
    return (
      <div className="col-xs-6 col-sm-3 header-left">
        <form className="form-inline sort-form">
          <Input type="select"
            label={I18n.t('ideas.index.sort.label')}
            placeholder="select"
            defaultValue={this.props.sort}
            onChange={this.props.onChange}
          >
            <option value="date">{I18n.t('ideas.index.sort.date')}</option>
            <option value="title">{I18n.t('ideas.index.sort.title')}</option>
            <option value="votes">{I18n.t('ideas.index.sort.votes')}</option>
          </Input>
        </form>
      </div>
    );
  }
}

export default IdeasSortComponent;
