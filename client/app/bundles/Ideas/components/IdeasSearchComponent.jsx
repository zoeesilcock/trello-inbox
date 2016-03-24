import React, { PropTypes } from 'react';
import { Input } from 'react-bootstrap';

export class IdeasSearchComponent extends React.Component {
  static propTypes = {
    search: PropTypes.string,
    onChange: PropTypes.func.isRequired,
  };

  render() {
    return (
      <div className="col-xs-12 col-sm-3 col-sm-offset-3 header-right">
        <form className="form-inline search-form">
          <Input type="text"
            name="search"
            defaultValue={this.props.search}
            onChange={this.props.onChange}
            placeholder={I18n.t('ideas.index.search.label')}
          />
        </form>
      </div>
    );
  }
}

export default IdeasSearchComponent;
